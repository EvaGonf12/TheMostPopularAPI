//
//  ArticlesListViewController.swift
//  TheMostPopularAPI
//
//  Created by Eva Gonzalez Ferreira on 30/12/21.
//

import UIKit

class ArticlesListViewController: UIViewController {
   
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = CustomColor.Grays.light
        table.dataSource = self
        table.delegate = self
        table.register(UINib(nibName: "ArticleTableViewCell", bundle: nil), forCellReuseIdentifier: "ArticleTableViewCell")
        table.estimatedRowHeight = 136
        table.rowHeight = UITableView.automaticDimension
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    private lazy var emptyLabel: UILabel = {
        let label = UILabel()
        label.textColor = CustomColor.Grays.extra
        label.text = "No hay artículos para los filtros aplicados."
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var refreshControl: UIRefreshControl = {
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        return refresh
    }()

    
    // MARK: - Properties
    
    let viewModel: ArticlesListViewModel
    
    // MARK: - Initializer
    
    init(viewModel: ArticlesListViewModel) {
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
        self.tableView.layoutSubviews()
    }
}

// MARK: - Private Setup
extension ArticlesListViewController: ArticlesListViewDelegate {
    
    func didFailLoadingArticles() {
        showError()
    }
    
    func didLoadArticles() {
        tableView.reloadData()
        emptyLabel.isHidden = viewModel.articlesList.count > 0
        refreshControl.endRefreshing()
    }
    
    func setupUI() {
        setup()
    }
    
}

// MARK: - Private Setup
extension ArticlesListViewController {
    func setup() {
        setupView()
        setupLayout()
    }
    
    func setupView() {
        title = ""
        view.addSubview(tableView)
        view.addSubview(emptyLabel)
        tableView.addSubview(refreshControl)
        emptyLabel.isHidden = true
        refreshControl.beginRefreshing()
    }
    
    func setupLayout() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        emptyLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-40)
            make.centerY.equalToSuperview()
        }
    }
    
    private func showError() {
        let alert = UIAlertController(title: "ERROR", message: "Ha ocurrido un error al obtener los datos de los artículos", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Recargar", style: UIAlertAction.Style.default, handler: {[weak self] _ in
            self?.emptyLabel.isHidden = true
            self?.viewModel.reloadArticles()
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - Actions

extension ArticlesListViewController {
    
    @objc func refresh(_ sender: AnyObject) {
        emptyLabel.isHidden = true
        viewModel.reloadArticles()
    }
    
}

// MARK: - UITableViewDataSource
extension ArticlesListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let currentCellViewModel = viewModel.viewModel(at: indexPath) {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell {
                cell.viewModel = currentCellViewModel
                cell.selectionStyle = .none
                return cell
            }
            fatalError()
        }
        fatalError()
    }
}

// MARK: - UITableViewDelegate
extension ArticlesListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.didSelectRow(at: indexPath)
    }

}
