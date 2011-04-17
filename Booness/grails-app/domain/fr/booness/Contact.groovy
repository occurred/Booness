package fr.booness

import fr.booness.param.ContactPost;

class Contact {

    String name
    ContactPost post
    String email
    String telephone
    String mobile
    String fax
    String website
    String street
    String extra
    String zip
    String city
    String country
    String description
	Compte compte
	
	static hasOne = [compte:Compte]

    static constraints = {
        name(nullable:false, blank:false)
        post()
        description(maxSize: 1024)
        email(nullable:true,email:true)
        website(nullable:true,url:true)
        telephone(nullable:true)
        mobile(nullable:true)
        fax(nullable:true)
        street(nullable:true)
        extra(nullable:true)
        zip(nullable:true)
        city(nullable:true)
        country(inList:["FR", "IT", "DE","ES", "BE","LU","CH", "UK"])
		compte(nullable:true)
    }

    static searchable=[only: ['name', 'description', 'telephone', 'mobile', 'fax']]
	
    String toString(){
        return name;
    }
}
