'use strict';

const fs = require('fs');

const configurator = require('./configurator');
const interactor = require('./interactor');
const protocol = require('./interface');
const presenter = require('./presenter');
const viewController = require('./viewcontroller');

const flagClass = /%CLASS%/g;

function createConfigurator(targetClass) {
    const i = configurator.createFileI();
    const s = configurator.createFileS(flagClass, targetClass);

    fs.writeFileSync(`./out/swift/FeatureConfigurator.swift`, i);
    fs.writeFileSync(`./out/swift/${targetClass}Configurator.swift`, s);
}

function createInteractor(targetClass) {
    const s = interactor.createFileS(flagClass, targetClass);

    fs.writeFileSync(`./out/swift/${targetClass}Interactor.swift`, s);
}

function createInterface(targetClass) {
    const i = protocol.createFileI(flagClass, targetClass);

    fs.writeFileSync(`./out/swift/${targetClass}Interface.swift`, i);
}

function createPresenter(targetClass) {
    const s = presenter.createFileS(flagClass, targetClass);

    fs.writeFileSync(`./out/swift/${targetClass}Presenter.swift`, s);
}

function createViewController(targetClass) {
    const s = viewController.createFileS(flagClass, targetClass);

    fs.writeFileSync(`./out/swift/${targetClass}ViewController.swift`, s);
}

function generateFile(targetClass) {
    fs.mkdirSync('./out/swift/', {recursive: true});
    createConfigurator(targetClass);
    createInteractor(targetClass);
    createInterface(targetClass);
    createPresenter(targetClass);
    createViewController(targetClass);
}

module.exports = {
    generateFile
};
