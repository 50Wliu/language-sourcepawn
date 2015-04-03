## 0.4.3 - April 2, 2015 A.D.
* Numbers after a `#pragma` are now tokenized
* Hex color codes (eg `\x0700FF00`) are now tokenized correctly
* Added keywords

## 0.4.2 - March 23, 2015 A.D.
* Improved new-style syntax support
	* Scoped `Action` and `Handle` (@viderizer)
	* Scoped `Plugin`
	* Scoped `null` as a constant and removed `NULL`
* Scoped `APLRes_Success`, `APLRes_Failure`, and `APLRes_SilentFailure` as constants
* Scoped all-caps variables as constants (eg `TIMER_FLAG_NO_MAPCHANGE`)
* Cleaned up and improved some snippets

## 0.4.1 - January 21, 2015 A.D.
* Removed language-specific settings as they were causing problems
	* Default ones seem to work fine
* Removed some unused regex (`and`, `bitand`, etc.)

## 0.4.0 - January 18, 2015 A.D.
* Fixed snippets not working
* Fixed settings not working
* Scoped all legacy tags, even user-created ones

## 0.3.1 - January 10, 2015 A.D.
* Renamed deprecated `scoped-properties` folder to `settings`
	* This package now requires at least Atom version 0.166.0 as a result
* Added initial specs

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