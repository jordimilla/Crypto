import Domain

final class RepositoryAssembly {
    
    static func makeSeriesRepository() -> CollectionRepository {
        let jsonReader = JSONFileReader()
        let dataSource = CollectionAPIDataSource(dependencies: .init(jsonFileReader: jsonReader))
        let dependencies = CollectionRepositoryImpl.Dependencies.init(collectionDataSource: dataSource)
        let repository = CollectionRepositoryImpl(dependencies: dependencies)
        return repository
    }
}

