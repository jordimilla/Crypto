extension TabBarViewController {
    
    func setupViewModel() {
        bindSelectedIndex()
    }

    private func bindSelectedIndex() {
        viewModel.$selectedIndex.bind(fire: true) { [weak self] selectedIndex in
            self?.tabBar.selectedIndex = selectedIndex
            self?.currentIndex = selectedIndex
        }
    }
}
    
