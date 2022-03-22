extension TabBarViewController {
    
    func setupViewModel() {
        bindSelectedIndex()
        bindCollectionCompleted()
    }

    private func bindSelectedIndex() {
        viewModel.$selectedIndex.bind(fire: true) { [weak self] selectedIndex in
            self?.tabBar.selectedIndex = selectedIndex
            self?.currentIndex = selectedIndex
        }
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
                
                self?.setupTabBarController(data: collection)
            case .failure:
                print("failure")
            }
        }
    }
}
    
