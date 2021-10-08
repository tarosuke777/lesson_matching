const { environment } = require('@rails/webpacker')

// Module not found: Error: Can't resolve './fonts/bootstrap-icons.woff?856008caa5eb66df68595e734e59580d
// https://github.com/rails/webpacker/blob/76b491750993fada8b0b0cc2546dfcfbc4aaae13/docs/css.md#resolve-url-loader
environment.loaders.get('sass').use.splice(-1, 0, {
    loader: 'resolve-url-loader'
});

module.exports = environment
