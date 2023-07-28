'use strict';

/*
  MIT License

  Copyright (c) 2023 Fay-Ho

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.
*/

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
