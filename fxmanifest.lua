fx_version 'cerulean';
game 'gta5';

author 'JustGod';
description 'jClassLib - A simple library for FiveM to use in all my resources';

server_script '@oxmysql/lib/MySQL.lua';
shared_script '@es_extended/imports.lua';

files {

    'system/**/*.lua',
    'enums/**/*.lua',
    'classes/**/*.lua',
    'events/**/*.lua',
    'imports.lua'

};

dependency 'oxmysql';