local home = os.getenv('HOME')
local music_root = home + '/files/music'

return {
    music = {
        root = music_root,
        library = music_root .. '/library',
        playlists = music_root .. '/playlists'
    }
}
