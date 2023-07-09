"use strict";

const global_class = /%CLASS%/g;

const configurator_i =`import UIKit

protocol FeatureConfigurator {
    func makeViewController() -> UIViewController
}`;

const configurator = `import UIKit

class %CLASS%Configurator: FeatureConfigurator {
    func makeViewController() -> UIViewController {
        let interactor = %CLASS%Interactor()
        let presenter = %CLASS%Presenter()
        let viewController = %CLASS%ViewController()
        
        interactor.presenter = presenter
        presenter.viewController = viewController
        viewController.interactor = interactor
        
        return viewController
    }
}`;

let configurator_i_s = configurator_i.replace(global_class, "Person");
console.log(configurator_i_s);

let configurator_s = configurator.replace(global_class, "Person");
console.log(configurator_s);
