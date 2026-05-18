const cds = require('@sap/cds')

module.exports = class BookstoreService extends cds.ApplicationService {
    init() {
        const { Books } = this.entities

        this.before('READ', Books, async (req) => {
            console.log('Before reading books')
        })
        this.on('READ', Books, async (req, next) => {
            console.log('During reading books')
            return next()
        })
        this.after('READ', Books, async (books, req) => {
            for (const book of books) {
                if (book.genre_code === 'Art') {
                    book.price = book.price * 0.8
                }
            }
            console.log('After reading books')
        })

        return super.init()
    }
}