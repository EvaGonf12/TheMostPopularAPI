//
//  ArticleDetailsViewController.swift
//  TheMostPopularAPI
//
//  Created by Eva Gonzalez Ferreira on 30/12/21.
//

import UIKit
import WebKit
import SnapKit

class ArticleDetailsViewController: UIViewController {


    // MARK: - Components
    
    private lazy var webView: WKWebView? = {
        let webview = WKWebView()
        webview.navigationDelegate = self
        guard let url = URL(string: viewModel.link) else {
            return nil
        }
        webview.load(URLRequest(url: url))
        webview.allowsBackForwardNavigationGestures = true
        return webview
    }()
    
    private lazy var labelError: UILabel = {
        let label = UILabel()
        label.textColor = CustomColor.Grays.extra
        label.text = "El link no es válido"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Properties

    let viewModel: ArticleDetailsViewModel
    
    init(viewModel: ArticleDetailsViewModel) {
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
extension ArticleDetailsViewController: ArticleDetailsViewDelegate {
    func setupUI() {
        setup()
    }
}

// MARK: - Private Setup
private extension ArticleDetailsViewController {
    
    func setup() {
        setupView()
        setupLayout()
    }
    
    func setupView() {
        title = viewModel.title
        view.backgroundColor = CustomColor.Grays.light
        
        if let webView = webView {
            view.addSubview(webView)
        } else {
            view.addSubview(labelError)
        }
    }
    
    func setupLayout() {
        if let webView = webView {
            webView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        } else {
            labelError.snp.makeConstraints { make in
                make.center.equalToSuperview()
            }
        }
    }
    
    private func showError() {
        let alert = UIAlertController(title: "ERROR", message: "No ha sido posible cargar el contenido del artículo", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {[weak self] _ in
            self?.viewModel.goBack()
        }))
        
        self.present(alert, animated: true, completion: nil)
    }

}

extension ArticleDetailsViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        showError()
    }
}
