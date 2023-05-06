fx_version 'cerulean';
game 'gta5';

author 'JustGod';
description 'jClassLib - A simple library for FiveM to use in all my resources';

server_script '@oxmysql/lib/MySQL.lua';
shared_script '@es_extended/imports.lua';
shared_script 'enums/**/*.lua';
shared_script 'lib/index.lua';

files {

    'system/**/*.lua',
    'enums/**/*.lua',
    'lib/**/*.lua',
    'classes/**/*.lua',
    'events/**/*.lua',
    'imports.lua'

};

dependency 'oxmysql';