'use strict';

const fs = require('fs');

const configurator = require('./configurator');
const interactor = require('./interactor');
const protocol = require('./interface');
const presenter = require('./presenter');
const viewController = require('./viewcontroller');

const flagPrefix = /%PREFIX%/g;
const flagClass = /%CLASS%/g;

function createConfigurator(targetPrefix, targetClass) {
    const name = targetPrefix+targetClass;
    const i = configurator.createFileI(flagPrefix, targetPrefix);
    const h = configurator.createFileH(flagPrefix, targetPrefix, flagClass, targetClass);
    const m = configurator.createFileM(flagPrefix, targetPrefix, flagClass, targetClass);

    fs.writeFileSync(`./out/objc/${targetPrefix}FeatureConfigurator.h`, i);
    fs.writeFileSync(`./out/objc/${name}Configurator.h`, h);
    fs.writeFileSync(`./out/objc/${name}Configurator.m`, m);
}

function createInteractor(targetPrefix, targetClass) {
    const name = targetPrefix+targetClass;
    const h = interactor.createFileH(flagPrefix, targetPrefix, flagClass, targetClass);
    const m = interactor.createFileM(flagPrefix, targetPrefix, flagClass, targetClass);

    fs.writeFileSync(`./out/objc/${name}Interactor.h`, h);
    fs.writeFileSync(`./out/objc/${name}Interactor.m`, m);
}

function createInterface(targetPrefix, targetClass) {
    const name = targetPrefix+targetClass;
    const i = protocol.createFileI(flagPrefix, targetPrefix, flagClass, targetClass);

    fs.writeFileSync(`./out/objc/${name}Interface.h`, i);
}

function createPresenter(targetPrefix, targetClass) {
    const name = targetPrefix+targetClass;
    const h = presenter.createFileH(flagPrefix, targetPrefix, flagClass, targetClass);
    const m = presenter.createFileM(flagPrefix, targetPrefix, flagClass, targetClass);

    fs.writeFileSync(`./out/objc/${name}Presenter.h`, h);
    fs.writeFileSync(`./out/objc/${name}Presenter.m`, m);
}

function createViewController(targetPrefix, targetClass) {
    const name = targetPrefix+targetClass;
    const h = viewController.createFileH(flagPrefix, targetPrefix, flagClass, targetClass);
    const m = viewController.createFileM(flagPrefix, targetPrefix, flagClass, targetClass);

    fs.writeFileSync(`./out/objc/${name}ViewController.h`, h);
    fs.writeFileSync(`./out/objc/${name}ViewController.m`, m);
}

function generateFile(targetPrefix, targetClass) {
    fs.mkdirSync('./out/objc/', {recursive: true});
    createConfigurator(targetPrefix, targetClass);
    createInteractor(targetPrefix, targetClass);
    createInterface(targetPrefix, targetClass);
    createPresenter(targetPrefix, targetClass);
    createViewController(targetPrefix, targetClass);
}

module.exports = {
    generateFile
};
