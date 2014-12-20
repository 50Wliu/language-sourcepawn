## 0.3.0 - December 19, 2014 A.D.
* Fixed untagged functions (eg `public ThisIsAFunction()` or `AnotherFunction()`) not being scoped
* Added `Plugin_Continue`, `Plugin_Changed`, `Plugin_Handled`, and `Plugin_Stop` as constants
* Added `forward` as a storage modifier
* Added `#endinput` as a preprocessor keyword

## 0.2.0 - December 13, 2014 A.D.
* Fixed tagged functions not being interpreted correctly (eg `TFClassType:TF2_GetClientClass()`)
* Added `INVALID_HANDLE` as a constant (`true`, `false`, etc.)
* Added `stock` as a storage modifier (`public`, `const`, etc.)
* Removed unused `special_block` regex
* Fixed legacy storage types also being tagged as a ternary operator

## 0.1.0 - December 10, 2014 A.D.
* Initial release
* Some support may be lacking but will hopefully be improved
* No official support for SM 1.7 (yet)