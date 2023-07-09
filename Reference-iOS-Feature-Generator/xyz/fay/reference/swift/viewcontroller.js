"use strict";

const global_class = /%CLASS%/g;

const view_controller = `import UIKit

class %CLASS%ViewController: UIViewController {
    var interactor: %CLASS%InteractorInterface?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension %CLASS%ViewController: %CLASS%ViewControllerInterface {}`;

let view_controller_s = view_controller_h.replace(global_class, "Person");
console.log(view_controller_s);
