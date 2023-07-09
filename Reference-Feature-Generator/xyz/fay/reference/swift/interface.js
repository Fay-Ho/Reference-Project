"use strict";

const global_class = /%CLASS%/g;

const interfaces = `import Foundation

protocol %CLASS%InteractorInterface {}

protocol %CLASS%PresenterInterface {}

protocol %CLASS%ViewControllerInterface: NSObject {}`;

let interfaces_s = interfaces.replace(global_class, "Person");
console.log(interfaces_s);
