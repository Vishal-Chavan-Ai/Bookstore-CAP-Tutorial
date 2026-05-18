this.before('READ', Books, async(req) => { })

this.on('READ', Books, async(req, next) => {
    return next()
})

this.after('READ', Books, async(books, req) => {})