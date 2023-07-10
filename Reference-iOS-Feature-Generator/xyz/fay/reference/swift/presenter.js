"use strict";

const global_class = /%CLASS%/g;

const presenter = `class %CLASS%Presenter {
    weak var viewController: %CLASS%ViewControllerInterface?
}

extension %CLASS%Presenter : %CLASS%PresenterInterface {}`;

let presenter_s = presenter.replace(global_class, "Person");
console.log(presenter_s);
