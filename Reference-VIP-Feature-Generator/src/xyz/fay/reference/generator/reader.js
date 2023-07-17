'use strict';

const fs = require('fs');

const license = require('../template/license')
const writer = require('./writer');

function readline() {
    let result = '';
    const buffer = Buffer.alloc ? Buffer.alloc(1) : new Buffer(1);
    for (;;) {
        fs.readSync(0, buffer, 0, 1);
        if (buffer[0] === 10) {
            break;
        } else if (buffer[0] !== 13) {
            result += buffer.toString();
        }
    }
    return result.trim();
}

function readInput() {
    console.log('Welcome to using Reference-VIP-Feature-Generator!!');
    console.log('Please entry the output path:');
    let output = readline();
    console.log();

    console.log('Please entry the prefix for `Objective-C` file. (e.g. `FRDashboardViewController`, default is `FR`):');
    let prefix = readline();
    console.log();

    console.log('Please entry the feature name. (e.g. `Dashboard`, generate `DashboardViewController` and other, default is `Sample`):');
    let name = readline();
    console.log();

    if (!output || output === '') {
        output = './'
    }

    if (!prefix || prefix === '') {
        prefix = 'FR';
    }

    if (!name || name === '') {
        name = 'Sample';
    }

    writer.generateFile(output, license.mitLicense(), prefix, name);
}

module.exports = {
    readInput
}
