package fr.booness

class StoredFileController {

    def scaffold=true
    
    def save = {
        def downloadedfile = request.getFile('file')
        StoredFile file=new StoredFile(name:params.name, path: name+'.'+Math.random())
        downloadedfile.transferTo(new File('c:/somefolder/filename.jpeg'))
    }
}
