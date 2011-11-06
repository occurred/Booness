dataSource {
    pooled = true
    driverClassName = "com.mysql.jdbc.Driver"
    username = "caleffi"
    password = "caleffi"
    dialect=org.hibernate.dialect.MySQLInnoDBDialect
    properties {
        validationQuery="select 1"
        testWhileIdle=true
        timeBetweenEvictionRunsMillis=60000
    }
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
}

// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop','update'
            url = "jdbc:mysql://localhost:3306/caleffi"
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:mysql://localhost:3306/Booness_test"
        }
    }
    production {
        dataSource {
            dbCreate = "update"
            url = "jdbc:mysql://localhost:3306/caleffi"
        }
    }

    deployment {
        dataSource{
            dbCreate = "update"
            url = "jdbc:mysql://localhost:3307/caleffi"
        }
    }
}
