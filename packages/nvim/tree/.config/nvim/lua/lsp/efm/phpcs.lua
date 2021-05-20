return {
    lintCommand = './vendor/bin/phpcs --report=emacs',
    lintFormats = {'%f:%l:%c: %trror - %m', '%f:%l:%c: %tarning - %m'}
    -- rootMarkers = {'composer.json'}
}
