const path = require('path')
const express = require('express')
const xss = require('xss')
const logger = require('../logger')
const GroceriesService = require('./groceries-service')

const groceriesRouter = express.Router()
const bodyParser = express.json()

const serializeGrocery = grocery => ({
    id: grocery.id,
    name: xss(grocery.name),
    category: grocery.category,
    location: grocery.location,
    expiry_reminder: grocery.expiry_reminder,
    expiry_date: grocery.expiry_date,
    notes: xss(grocery.notes),
    quantity: Number(grocery.quantity),
    unit: xss(grocery.unit),
    price: grocery.price,
    image: xss(grocery.image)
})

groceriesRouter
    .route('/')
    .get((req, res, next) => {
        GroceriesService.getAllGroceries(req.app.get('db'))
            .then(groceries => {
                res.json(groceries.map(serializeGrocery))
            })
            .catch(next)
    })
    .post(bodyParser, (req, res, next) => {
        const { name, category, location, expiry_reminder, expiry_date, quantity, unit, notes, price, image } = req.body
        const newGroceryItem = { name, category, location, expiry_reminder, expiry_date, quantity, unit, price, notes, image }
        console.log(newGroceryItem);
        for (const field of ['name', 'quantity', 'unit']) {
            if (!newGroceryItem[field]) {
                logger.error(`${field} is required`)
                return res.status(400).send({
                    error: { message: `'${field}' is required` }
                })
            }
        }
        GroceriesService.insertGrocery(
            req.app.get('db'),
            newGroceryItem
        )
            .then(grocery => {
                logger.info(`Grocery Item with id ${grocery.id} created.`)
                res
                    .status(201)
                    .location(path.posix.join(req.originalUrl, `${grocery.id}`))
                    .json(serializeGrocery(grocery))
            })
            .catch(next)
    })
groceriesRouter
    .route('/:grocery_id')

    .all((req, res, next) => {
        const { grocery_id } = req.params
        GroceriesService.getById(req.app.get('db'), grocery_id)
            .then(grocery => {
                if (!grocery) {
                    logger.error(`Grocery with id ${grocery_id} not found.`)
                    return res.status(404).json({
                        error: { message: `Grocery item Not Found` }
                    })
                }
                res.grocery = grocery
                next()
            })
            .catch(next)

    })

    .get((req, res) => {
        res.json(serializeGrocery(res.grocery))
    })

    .delete((req, res, next) => {
        const { grocery_id } = req.params
        GroceriesService.deleteGrocery(
            req.app.get('db'),
            grocery_id
        )
            .then(numRowsAffected => {
                logger.info(`Grocery item with id ${grocery_id} deleted.`)
                res.status(204).end()
            })
            .catch(next)
    })

    .patch(bodyParser, (req, res, next) => {
        const { name, category, location, expiry_reminder, expiry_date, quantity, unit, notes, price } = req.body
        const groceryToUpdate = { name, category, location, expiry_reminder, expiry_date, quantity, unit, notes, price }

        const numberOfValues = Object.values(groceryToUpdate).filter(Boolean).length
        if (numberOfValues === 0) {
            logger.error(`Invalid update without required fields`)
            return res.status(400).json({
                error: {
                    message: `Request body must content either 'title', 'url', 'description' or 'rating'`
                }
            })
        }

        GroceriesService.updateGrocery(
            req.app.get('db'),
            req.params.grocery_id,
            groceryToUpdate
        )
            .then(numRowsAffected => {
                res.status(204).end()
            })
            .catch(next)
    })

module.exports = groceriesRouter
