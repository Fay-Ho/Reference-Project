"use strict";

const global_class = /%CLASS%/g;

const interactor = `class %CLASS%Interactor {
    var presenter: %CLASS%PresenterInterface?
}

extension %CLASS%Interactor: %CLASS%InteractorInterface {}`;

let interactor_s = interactor.replace(global_class, "Person");
console.log(interactor_s);
