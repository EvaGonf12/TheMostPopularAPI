//
//  FilterViewController.swift
//  TheMostPopularAPI
//
//  Created by Eva Gonzalez Ferreira on 30/12/21.
//

import UIKit
import SnapKit
import SwiftUI

private enum ViewLayout {
    static let stackSpacing = 10.0
    static let marginL = 20.0
    static let marginT = -20.0
    static let marginStack = 20.0
    static let checkbozSize = CGSize(width: 40, height: 40)
    static let pickerHeight = 120.0
}

class FilterViewController: UIViewController {
   
    // MARK: - Components
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.bounces = false
        scrollView.backgroundColor = CustomColor.Grays.light
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private lazy var contentScroll: UIView = {
        let content = UIView()
        content.backgroundColor = CustomColor.Grays.light
        content.translatesAutoresizingMaskIntoConstraints = false
        return content
    }()
    
    private lazy var screenTitle: UILabel = {
        let label = UILabel()
        label.textColor = CustomColor.Grays.extra
        label.text = Texts.Filter.title
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var labelType: UILabel = {
        let label = UILabel()
        label.textColor = CustomColor.Grays.extra
        label.text = Texts.Filter.type
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var labelInterval: UILabel = {
        let label = UILabel()
        label.textColor = CustomColor.Grays.extra
        label.text = Texts.Filter.interval
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var labelSource: UILabel = {
        let label = UILabel()
        label.textColor = CustomColor.Grays.extra
        label.text = Texts.Filter.source
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var pickerType: UIPickerView = {
        let picker = UIPickerView()
        picker.tag = 0
        picker.delegate = self
        picker.dataSource = self
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    private lazy var pickerInterval: UIPickerView = {
        let picker = UIPickerView()
        picker.tag = 1
        picker.delegate = self
        picker.dataSource = self
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    private lazy var checkboxFacebook: CheckBox = {
        let checkbox = CheckBox()
        checkbox.style = .tick
        checkbox.borderStyle = .roundedSquare(radius: 4)
        checkbox.translatesAutoresizingMaskIntoConstraints = false
        return checkbox
    }()
    
    private lazy var checkboxTwitter: CheckBox = {
        let checkbox = CheckBox()
        checkbox.style = .tick
        checkbox.borderStyle = .roundedSquare(radius: 4)
        checkbox.translatesAutoresizingMaskIntoConstraints = false
        return checkbox
    }()
    
    // STACKS
    
    private lazy var stackType: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [labelType, pickerType])
        stack.axis = .vertical
        stack.spacing = ViewLayout.stackSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var stackSource: UIStackView = {
        let facebook = UILabel()
        facebook.text = "Facebook"
        facebook.textColor = CustomColor.Grays.extra
        
        let stackFacebook = UIStackView(arrangedSubviews: [checkboxFacebook, facebook, UIView()])
        stackFacebook.axis = .horizontal
        stackFacebook.spacing = ViewLayout.stackSpacing
       
        let twitter = UILabel()
        twitter.text = "Twitter"
        twitter.textColor = CustomColor.Grays.extra
        
        let stackTwiter = UIStackView(arrangedSubviews: [checkboxTwitter, twitter, UIView()])
        stackTwiter.axis = .horizontal
        stackTwiter.spacing = ViewLayout.stackSpacing
       
        let stack = UIStackView(arrangedSubviews: [labelSource, stackFacebook, stackTwiter])
        stack.axis = .vertical
        stack.spacing = ViewLayout.stackSpacing
        stack.isHidden = true
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    
    private lazy var stackInterval: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [labelInterval, pickerInterval])
        stack.axis = .vertical
        stack.spacing = ViewLayout.stackSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    private lazy var applyButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = CustomColor.Primary.blue
        button.layer.cornerRadius = 8
        button.setTitle("Filtrar", for: .normal)
        button.addTarget(self, action: #selector(applyFilters), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Properties
    
    let viewModel: FilterViewModel
    
    var typeSelected: ArticleType?
    var intervalSelected: ArticlesInterval?
    
    init(viewModel: FilterViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barStyle = .default
        setNeedsStatusBarAppearanceUpdate()
        viewModel.didLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barStyle = .default
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

// MARK: - IdeaFormViewDelegate
extension FilterViewController: FilterViewDelegate {
    func setupUI() {
        setup()
    }
}

// MARK: - Private Setup
private extension FilterViewController {
    
    func setup() {
        setupView()
        setupLayout()
        setupData()
    }
    
    func setupView() {
        title = Texts.Filter.title
        view.backgroundColor = CustomColor.Grays.light
        view.addSubview(scrollView)
        scrollView.addSubview(contentScroll)
        contentScroll.addSubview(stackType)
        contentScroll.addSubview(stackInterval)
        contentScroll.addSubview(stackSource)
        contentScroll.addSubview(applyButton)
    }
    
    func setupLayout() {
        scrollView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        contentScroll.snp.makeConstraints { make in
            make.bottom.equalTo(scrollView.snp.bottom)
            make.top.equalTo(scrollView.snp.top)
            make.leading.equalTo(scrollView.snp.leading)
            make.trailing.equalTo(scrollView.snp.trailing)
            make.width.equalTo(scrollView.snp.width)
            make.height.equalTo(scrollView.snp.height).priority(250)
        }
        
        stackType.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(ViewLayout.marginL)
            make.trailing.equalToSuperview().offset(ViewLayout.marginT)
            make.top.equalToSuperview()
        }
        
        stackInterval.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(ViewLayout.marginL)
            make.trailing.equalToSuperview().offset(ViewLayout.marginT)
            make.top.equalTo(stackType.snp.bottom).offset(ViewLayout.marginStack)
        }
        
        stackSource.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(ViewLayout.marginL)
            make.trailing.equalToSuperview().offset(ViewLayout.marginT)
            make.top.equalTo(stackInterval.snp.bottom).offset(ViewLayout.marginStack)
        }
        
        applyButton.snp.makeConstraints { make in
            make.top.equalTo(stackSource.snp.bottom).offset(ViewLayout.marginStack)
            make.leading.equalToSuperview().offset(ViewLayout.marginL)
            make.trailing.equalToSuperview().offset(ViewLayout.marginT)
            make.height.equalTo(44.0)
            make.bottom.equalToSuperview()
        }
        
        pickerType.snp.makeConstraints { make in
            make.height.equalTo(ViewLayout.pickerHeight)
        }

        pickerInterval.snp.makeConstraints { make in
            make.height.equalTo(ViewLayout.pickerHeight)
        }
        
        checkboxFacebook.snp.makeConstraints { make in
            make.size.equalTo(ViewLayout.checkbozSize)
        }
        
        checkboxTwitter.snp.makeConstraints { make in
            make.size.equalTo(ViewLayout.checkbozSize)
        }
    }
    
    func setupData() {
        self.typeSelected = viewModel.types[0]
        self.intervalSelected = viewModel.intervals[0]
    }
    
    @objc func applyFilters() {
        // Article type
        guard let typeSelected = self.typeSelected,
              let intervalSelected = self.intervalSelected else {
                  showError()
                  return
              }
        var sources : [MostSharedSource] = []
        if typeSelected == .mostshared && checkboxTwitter.isChecked {
            sources.append(.twitter)
        }
        if typeSelected == .mostshared && checkboxFacebook.isChecked {
            sources.append(.facebook)
        }
        viewModel.applyFilter(type: typeSelected, interval: intervalSelected, articleSource: sources)
    }
    
    private func showError() {
        // create the alert
        let alert = UIAlertController(title: "Campos vacíos", message: "Faltan filtros por seleccionar", preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
}

extension FilterViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 44.0
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
            case 0:
                return viewModel.types.count
            case 1:
                return viewModel.intervals.count
            default:
                return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
            case 0:
                let row = "\(viewModel.types[row].rawValue)"
                return row
            case 1:
                let row = "\(viewModel.intervals[row].rawValue) \(row == 0 ? Texts.Global.day : Texts.Global.days)"
                return row
            default:
                return ""
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch pickerView.tag {
            case 0:
                stackSource.isHidden = viewModel.types[row] != .mostshared
                typeSelected = viewModel.types[row]
            case 1:
                intervalSelected = viewModel.intervals[row]
            default:
                    return
        }
        
    }
}
