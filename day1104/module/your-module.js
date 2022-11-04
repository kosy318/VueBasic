// import { cube, hello as hi, user, foo } from "./my-module.js";
import * as module from "./my-module.js";

// console.log(cube(3));
// console.log(hi("gogo"));
// console.log(user.name, user.name, user.address);
// console.log(foo);

console.log(module.cube(3));
console.log(module.hello("gogo"));
console.log(module.user.name, module.user.name, module.user.address);
console.log(module.foo);

// default import
import dawoon from "./my-module.js";
console.log(dawoon.id, dawoon.name);
