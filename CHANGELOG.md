## 0.7.2 - August 22, 2016 A.D.
* Added `Database`, `Menu`, and `Panel` as valid storage types (@DjCoraxa)

## 0.7.1 - August 17, 2016 A.D.
* Added `public` and `static` as valid storage modifiers

## 0.7.0 - March 17, 2016 A.D.
* Fixed complex return statements being tokenized as functions
* Fixed functions with return types but no storage modifier (such as `bool:hello() {}`) not being tokenized as functions
* Fixed `storage.type.sp` and `storage.type.legacy.sp` getting switched in functions
* Added more specs

## 0.6.0 - February 3, 2016 A.D.
* Sync with [language-c](https://github.com/atom/language-c) to bring in many improvements
* Remove unnecessary rules
* Conform code style to match other language repositories (2 spaces)
* Enable Coffeelint
* More improvements coming soon!

## 0.5.1 - February 2, 2016 A.D.
* Changed `scopeName` to `source.sp` instead of `source.sourcepawn`
* Removed `.inc` setting and bumped minimum required Atom version to v0.200.0
	* Atom versions v0.200.0 and above support setting custom languages for files
* Added support for `.sma` files
* Rudimentary support for preprocessor definitions (the `#` in `#define`, for example)
	* Taken from [atom/language-c#79](https://github.com/atom/language-c/pull/79)
* Scoped `ConVar`, `KeyValues`, `Plugin`, `StringMap`, `TopMenu`, and `APLRes` as storage types
* Added basic specs to test against regressions

## 0.5.0 - April 10, 2015 A.D.
* Added a setting to force `.inc` files to use Sourcepawn highlighting

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
