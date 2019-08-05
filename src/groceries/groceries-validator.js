const { isWebUri } = require('valid-url')
const logger = require('../logger')

const NO_ERRORS = null

function getGroceryValidationError({ url, quantity }) {
    if (quantity &&
        (!Number.isInteger(quantity) || quantity < 0 || quantity > 100)) {
        logger.error(`Invalid quantity '${rating}' supplied`)
        return {
            error: {
                message: `'quantity' must be a number between 0 and 100`
            }
        }
    }

    if (url && !isWebUri(url)) {
        logger.error(`Invalid url '${url}' supplied`)
        return {
            error: {
                message: `'url' must be a valid URL`
            }
        }
    }

    return NO_ERRORS
}

module.exports = {
    getGroceryValidationError,
}
