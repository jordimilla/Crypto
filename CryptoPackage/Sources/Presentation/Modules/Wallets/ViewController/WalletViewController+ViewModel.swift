extension WalletsViewController {
    
    func setupViewModel() {
        bindCollectionCompleted()
    }
    
    private func bindCollectionCompleted() {
        viewModel.$collectionObservable.bind(fire: true) { [weak self] resource in
            guard let resource = resource else {
                return
            }
            switch resource {
            case .loading:
                print("Loading")
            case .success(let collection):
                self?.collectionData = collection
                self?.fiatWalletButton.activateButton(state: true)
                self?.tableView.reloadData()
            case .failure:
                print("failure")
            }
        }
    }
    
}
