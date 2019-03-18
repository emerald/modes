syn match Comment "%.*$"

syn region  Constant start=/"/ skip=/\\["\\]/ end=/"/
syn region  Constant start=/'/ skip=/\\['\\]/ end=/'/

syntax case ignore
