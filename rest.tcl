#!/usr/bin/tclsh

package require rest
package require http

set flickr(auth.getFrob) {
    url http://api.flickr.com/services/rest/?method=flickr.auth.getFrob
    req_args { api_key: secret: api_sig }
}

set flickr(test.echo) {
	#url http://api.flickr.com/services/rest/?method=flickr.test.echo&api_key=632dd66149536bdf7490c3974ca14691
	url http://api.flickr.com/services/rest
	req_args {api_key: method:}
}


rest::create_interface flickr 

puts "rest:\n"
#puts [flickr::auth.getFrob -api_key  ea4a4134e2821898e5e31713d2ad74fd -secret 8fa510ec0a542d11 -api_sig ae2a8124d5c4eb7c8b6d55584370ecb8]
puts [flickr::test.echo -api_key 632dd66149536bdf7490c3974ca14691 -method flickr.test.echo ]

puts "\nhttp:\n"
puts [http::data [http::geturl "http://api.flickr.com/services/rest/?method=flickr.test.echo&api_key=ea4a4134e2821898e5e31713d2ad74fc"]]
