import Domain

public class RepositoryAssembly {
    
    public static func makeCollectionRepository() -> CollectionRepository {
        let jsonReader = JSONFileReader()
        let dataSource = CollectionDataSourceImpl(jsonFileReader: jsonReader)
        let repository = CollectionRepositoryImpl(collectionDataSource: dataSource)
        
        return repository
    }
}

