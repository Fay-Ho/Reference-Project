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

const flagLicense = /%LICENSE%/g;
const flagPrefix = /%PREFIX%/g;
const flagName = /%NAME%/g;

const objcPath = 'out/objc/';
const swiftPath = 'out/swift/';

const configurator = require('../template/configurator');
const interactor = require('../template/interactor');
const protocol = require('../template/interface');
const presenter = require('../template/presenter');
const viewController = require('../template/viewcontroller');

function generateFile(targetPath, targetLicense, targetPrefix, targetName) {
    fs.mkdirSync(targetPath + objcPath, {recursive: true});
    fs.mkdirSync(targetPath + swiftPath, {recursive: true});
    createConfigurator(targetPath, targetLicense, targetPrefix, targetName);
    createInteractor(targetPath, targetLicense, targetPrefix, targetName);
    createInterface(targetPath, targetLicense, targetPrefix, targetName);
    createPresenter(targetPath, targetLicense, targetPrefix, targetName);
    createViewController(targetPath, targetLicense, targetPrefix, targetName);
}

function createConfigurator(targetPath, targetLicense, targetPrefix, targetName) {
    const oi = configurator.createObjcInterface(flagLicense, targetLicense, flagPrefix, targetPrefix);
    const h = configurator.createHeader(flagLicense, targetLicense, flagPrefix, targetPrefix, flagName, targetName);
    const m = configurator.createMessage(flagLicense, targetLicense, flagPrefix, targetPrefix, flagName, targetName);
    const si = configurator.createSwiftInterface(flagLicense, targetLicense);
    const s = configurator.createSwift(flagLicense, targetLicense, flagName, targetName);
    const targetMixName = targetPrefix + targetName;

    fs.writeFileSync(targetPath + objcPath + targetPrefix + 'FeatureConfigurator.h', oi);
    fs.writeFileSync(targetPath + objcPath + targetMixName + 'Configurator.h', h);
    fs.writeFileSync(targetPath + objcPath + targetMixName + 'Configurator.m', m);
    fs.writeFileSync(targetPath + swiftPath + 'FeatureConfigurator.swift', si);
    fs.writeFileSync(targetPath + swiftPath + targetName + 'Configurator.swift', s);
}

function createInteractor(targetPath, targetLicense, targetPrefix, targetName) {
    const h = interactor.createHeader(flagLicense, targetLicense, flagPrefix, targetPrefix, flagName, targetName);
    const m = interactor.createMessage(flagLicense, targetLicense, flagPrefix, targetPrefix, flagName, targetName);
    const s = interactor.createSwift(flagLicense, targetLicense, flagName, targetName);
    const targetMixName = targetPrefix + targetName;

    fs.writeFileSync(targetPath + objcPath + targetMixName + 'Interactor.h', h);
    fs.writeFileSync(targetPath + objcPath + targetMixName + 'Interactor.m', m);
    fs.writeFileSync(targetPath + swiftPath + targetName + 'Interactor.swift', s);
}

function createInterface(targetPath, targetLicense, targetPrefix, targetName) {
    const h = protocol.createHeader(flagLicense, targetLicense, flagPrefix, targetPrefix, flagName, targetName);
    const s = protocol.createSwift(flagLicense, targetLicense, flagName, targetName);
    const targetMixName = targetPrefix + targetName;

    fs.writeFileSync(targetPath + objcPath + targetMixName + 'Interface.h', h);
    fs.writeFileSync(targetPath + swiftPath + targetName + 'Interface.swift', s);
}

function createPresenter(targetPath, targetLicense, targetPrefix, targetName) {
    const h = presenter.createHeader(flagLicense, targetLicense, flagPrefix, targetPrefix, flagName, targetName);
    const m = presenter.createMessage(flagLicense, targetLicense, flagPrefix, targetPrefix, flagName, targetName);
    const s = presenter.createSwift(flagLicense, targetLicense, flagName, targetName);
    const targetMixName = targetPrefix + targetName;

    fs.writeFileSync(targetPath + objcPath + targetMixName + 'Presenter.h', h);
    fs.writeFileSync(targetPath + objcPath + targetMixName + 'Presenter.m', m);
    fs.writeFileSync(targetPath + swiftPath + targetName + 'Presenter.swift', s);
}

function createViewController(targetPath, targetLicense, targetPrefix, targetName) {
    const h = viewController.createHeader(flagLicense, targetLicense, flagPrefix, targetPrefix, flagName, targetName);
    const m = viewController.createMessage(flagLicense, targetLicense, flagPrefix, targetPrefix, flagName, targetName);
    const s = viewController.createSwift(flagLicense, targetLicense, flagName, targetName);
    const targetMixName = targetPrefix + targetName;

    fs.writeFileSync(targetPath + objcPath + targetMixName + 'ViewController.h', h);
    fs.writeFileSync(targetPath + objcPath + targetMixName + 'ViewController.m', m);
    fs.writeFileSync(targetPath + swiftPath + targetName + 'ViewController.swift', s);
}

module.exports = {
    generateFile
}
