'use strict';

const objcWriter = require('./xyz/fay/reference/objc/writer');
const swiftWriter = require('./xyz/fay/reference/swift/writer');

function main() {
    objcWriter.generateFile('FR', 'City');
    swiftWriter.generateFile('City');
}

main();
