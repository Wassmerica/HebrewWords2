//
//  WordsPageViewController.swift
//  HebrewWords
//
//  Created by Michael Wasserman on 2018-05-16.
//  Copyright © 2018 Wasserman. All rights reserved.
//

import UIKit

class WordsPageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    var wordsSet: [Word]?
    var pageControl = UIPageControl()
    lazy var orderedViewControllers: [UIViewController] = {
        return [self.nextViewController(viewController: "Words1", index: 1),
                self.nextViewController(viewController: "Words2", index: 2),
                self.nextViewController(viewController: "Words3", index: 3)]
    }()
    
    //MARK: - UIPageViewControllerDataSource Methods
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        // User is on the first view controller and swiped left to loop to the last view controller.
        guard previousIndex >= 0 else {
            return orderedViewControllers.last
            // return nil so pages won't loop
            // return nil
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        // User is on the last view controller and swiped right to loop to the first view controller.
        guard orderedViewControllersCount != nextIndex else {
            return orderedViewControllers.first
            // return nil so pages won't loop
            // return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
    
    //MARK: - UIPageViewControllerDelegate Methods
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage  = orderedViewControllers.index(of: pageContentViewController)!
    }
    
    //MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self
        
        // This sets up the first view that will show up on our page control
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
        self.delegate = self
        configurePageControl()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Helper Methods
    func nextViewController(viewController: String, index: Int) -> UIViewController {
        switch index {
        case 1:
            if let newVC = UIStoryboard(name: "WordSet", bundle: nil).instantiateViewController(withIdentifier: viewController) as? WordSet1ViewController {
                if let arrSlice = wordsSet?[0...5] {
                    newVC.wordSet = Array(arrSlice)
                }
                return newVC
            }
        case 2:
            if let newVC = UIStoryboard(name: "WordSet", bundle: nil).instantiateViewController(withIdentifier: viewController) as? WordSet2ViewController {
                if let arrSlice = wordsSet?[6...11] {
                    newVC.wordSet = Array(arrSlice)
                }
                return newVC
            }
        case 3:
            if let newVC = UIStoryboard(name: "WordSet", bundle: nil).instantiateViewController(withIdentifier: viewController) as? WordSet3ViewController {
                if let arrSlice = wordsSet?[12...17] {
                    newVC.wordSet = Array(arrSlice)
                }
                return newVC
            }
        
        default:
            return (UIStoryboard(name: "WordSet", bundle: nil).instantiateViewController(withIdentifier: viewController) as? WordSet1ViewController)!
        }
        
        return UIStoryboard(name: "WordSet", bundle: nil).instantiateViewController(withIdentifier: viewController)
    }
    
    func configurePageControl() {
        pageControl = UIPageControl(frame: CGRect(x: 0,y: UIScreen.main.bounds.maxY - 50,width: UIScreen.main.bounds.width,height: 50))
        self.pageControl.numberOfPages                 = orderedViewControllers.count
        self.pageControl.currentPage                   = 0
        self.pageControl.tintColor                     = UIColor.black
        self.pageControl.pageIndicatorTintColor        = UIColor.gray
        self.pageControl.currentPageIndicatorTintColor = UIColor.black
        self.view.addSubview(pageControl)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
