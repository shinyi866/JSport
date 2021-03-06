//
//  ViewController.swift
//  JS
//
//  Created by apple on 2018/2/2.
//  Copyright © 2018年 Json.test1. All rights reserved.
//

import UIKit
//import Firebase
//import FirebaseAuth
//import FirebaseDatabase


class ViewController: UIViewController , UIPageViewControllerDataSource , UIPageViewControllerDelegate , UIScrollViewDelegate , UITableViewDataSource , UITableViewDelegate{
    
//    @IBOutlet var input: UITextField!
//    @IBOutlet var table: UITableView!
//    @IBAction func putAction(_ sender: Any) {
////        data.append(inputField.text!)
//        data.insert(input.text!, at: 0)
//        table.reloadData()
//    }
    
    @IBAction func Main(segue: UIStoryboardSegue){

    }
    
    @IBOutlet var btnTab1: UIButton!
    @IBOutlet var btnTab2: UIButton!
    
    @IBOutlet var viewLine: UIView!
    @IBOutlet private weak var constantViewLeft: NSLayoutConstraint!
    
//    @IBOutlet weak var userMail: UILabel!
//    @IBAction func logout(_ sender: Any) {
//        if Auth.auth().currentUser != nil{
//            do{
//                try Auth.auth().signOut()
//                dismiss(animated: true, completion: nil)
//            } catch let error as NSError{
//                print(error.localizedDescription)
//            }
//        }
//    }
    
    
    var tab1VC:Tab1ViewController! = nil
    var tab2VC:Tab2ViewController! = nil
    var data: [String] = ["1","2","3"]
    
    private var pageController: UIPageViewController!
    private var arrVC:[UIViewController] = []
    private var currentPage: Int!
    @IBAction func backto (segue: UIStoryboardSegue){
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "MyCell"
        var cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "MyCell")
        }
        cell?.textLabel?.text = data[indexPath.row]
        
        return cell!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        //logout
//        userMail.text = Auth.auth().currentUser?.email
        
        currentPage = 0
        createPageViewController()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Custom Methods
    
    private func selectedButton(btn: UIButton) {
        
        btn.setTitleColor(UIColor.black, for: .normal)
        
        //constantViewLeft.constant = btn.frame.origin.x
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
        
    }
    
    private func unSelectedButton(btn: UIButton) {
        btn.setTitleColor(UIColor.lightGray, for: UIControlState.normal)
    }
    
    //MARK: - IBaction Methods
    
    @IBAction private func btnOptionClicked(btn: UIButton) {
        
        pageController.setViewControllers([arrVC[btn.tag-1]], direction: UIPageViewControllerNavigationDirection.reverse, animated: false, completion: {(Bool) -> Void in
        })
        
        resetTabBarForTag(tag: btn.tag-1)
    }
    
    //MARK: - CreatePagination
    
    private func createPageViewController() {
        
        pageController = UIPageViewController.init(transitionStyle: UIPageViewControllerTransitionStyle.scroll, navigationOrientation: UIPageViewControllerNavigationOrientation.horizontal, options: nil)
        
        pageController.view.backgroundColor = UIColor.clear
        pageController.delegate = self
        pageController.dataSource = self
        
        for svScroll in pageController.view.subviews as! [UIScrollView] {
            svScroll.delegate = self
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.pageController.view.frame = CGRect(x: 0, y:75, width: self.view.frame.size.width, height: self.view.frame.size.height-65)
        }
        
        let homeStoryboard = UIStoryboard(name: "Main", bundle: nil)
        tab1VC = homeStoryboard.instantiateViewController(withIdentifier: "Tab1VC") as! Tab1ViewController
        tab2VC = homeStoryboard.instantiateViewController(withIdentifier: "Tab2VC") as! Tab2ViewController
        //tab3VC = homeStoryboard.instantiateViewController(withIdentifier: "Tab2VC") as! Tab2ViewController
        
        arrVC = [tab1VC, tab2VC]
        
        pageController.setViewControllers([tab1VC], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
        
        self.addChildViewController(pageController)
        self.view.addSubview(pageController.view)
        pageController.didMove(toParentViewController: self)
    }
    
    
    private func indexofviewController(viewCOntroller: UIViewController) -> Int {
        if(arrVC .contains(viewCOntroller)) {
            return arrVC.index(of: viewCOntroller)!
        }
        
        return -1
    }
    
    //MARK: - Pagination Delegate Methods
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = indexofviewController(viewCOntroller: viewController)
        
        if(index != -1) {
            index = index - 1
        }
        
        if(index < 0) {
            return nil
        }
        else {
            return arrVC[index]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = indexofviewController(viewCOntroller: viewController)
        
        if(index != -1) {
            index = index + 1
        }
        
        if(index >= arrVC.count) {
            return nil
        }
        else {
            return arrVC[index]
        }
    }
    
    func pageViewController(_ pageViewController1: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if(completed) {
            currentPage = arrVC.index(of: (pageViewController1.viewControllers?.last)!)
            resetTabBarForTag(tag: currentPage)
        }
    }
    
    //MARK: - Set Top bar after selecting Option from Top Tabbar
    
    private func resetTabBarForTag(tag: Int) {
        
        var sender: UIButton!
        
        if(tag == 0) {
            sender = btnTab1
        }
        else if(tag == 1) {
            sender = btnTab2
        }
//        else if(tag == 2) {
//            sender = btnTab3
//        }
        
        currentPage = tag
        
        unSelectedButton(btn: btnTab1)
        unSelectedButton(btn: btnTab2)
        //unSelectedButton(btn: btnTab3)
        
        
        selectedButton(btn: sender)
        
    }

    //MARK: - UIScrollView Delegate Methods
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let xFromCenter: CGFloat = self.view.frame.size.width-scrollView.contentOffset.x
        let xCoor: CGFloat = CGFloat(viewLine.frame.size.width) * CGFloat(currentPage)
        let xPosition: CGFloat = xCoor - xFromCenter/CGFloat(arrVC.count)
        constantViewLeft.constant = xPosition
    }
    
}

//
//  YoController.swift
//  Login
//
//  Created by 郭 芷瑄 on 2018/1/31.
//  Copyright © 2018年 郭 芷瑄. All rights reserved.
//








    




