
Test04 - Flags applied:
# ruby
^.*/(ruby|irb|gem|rake|bundle|bundler)$,0,~SK|NI
/opt/puppetlabs/puppet/bin/ruby,0,TR

seivdilc89057:~ % cd ~/sample_ruby_on_rails_project
seivdilc89057:~/sample_ruby_on_rails_project % mkdir /home/farivera/sample_ruby_on_rails_project/gems_no_injection_04
seivdilc89057:~/sample_ruby_on_rails_project % printf '%s\n' '---' 'BUNDLE_PATH: "/home/farivera/sample_ruby_on_rails_project/gems_no_injection_04"' > .bundle/config
seivdilc89057:~/sample_ruby_on_rails_project % cat .bundle/config
---
BUNDLE_PATH: "/home/farivera/sample_ruby_on_rails_project/gems_no_injection_04"
seivdilc89057:~/sample_ruby_on_rails_project % 
seivdilc89057:~/sample_ruby_on_rails_project % 
seivdilc89057:~/sample_ruby_on_rails_project % date -Is
2026-10-27T10:25:19+01:00
seivdilc89057:~/sample_ruby_on_rails_project % time bundle install
Fetching gem metadata from https://artifactory-it.asml.com/artifactory/api/gems/rubygems/.........
Fetching rake 13.4.2
Installing rake 13.4.2
Fetching base64 0.3.0
Fetching bigdecimal 4.1.3
Fetching concurrent-ruby 1.3.8
Fetching connection_pool 3.0.2
Installing base64 0.3.0
Installing connection_pool 3.0.2
Fetching drb 2.2.3
Fetching json 3.1.0
Installing drb 2.2.3
Fetching logger 1.7.0
Installing json 3.1.0 with native extensions
Installing bigdecimal 4.1.3 with native extensions
Installing logger 1.7.0
Fetching prism 1.9.0
Installing concurrent-ruby 1.3.8
Installing prism 1.9.0 with native extensions
Fetching securerandom 0.4.1
Installing securerandom 0.4.1
Fetching uri 1.1.2
Installing uri 1.1.2
Fetching builder 3.3.0
Installing builder 3.3.0
Fetching erubi 1.13.1
Installing erubi 1.13.1
Fetching racc 1.8.1
Installing racc 1.8.1 with native extensions
Fetching crass 1.0.8
Installing crass 1.0.8
Fetching rack 3.2.7
Fetching useragent 0.16.11
Installing useragent 0.16.11
Fetching prettyprint 0.2.1
Installing prettyprint 0.2.1
Installing rack 3.2.7
Fetching erb 6.0.7
Fetching tsort 0.2.0
Installing erb 6.0.7 with native extensions
Installing tsort 0.2.0
Fetching io-console 0.9.4
Installing io-console 0.9.4 with native extensions
Fetching thor 1.5.0
Installing thor 1.5.0
Fetching zeitwerk 2.8.3
Fetching nio4r 2.7.5
Installing zeitwerk 2.8.3
Fetching websocket-extensions 0.1.5
Installing websocket-extensions 0.1.5
Installing nio4r 2.7.5 with native extensions
Fetching timeout 0.6.1
Installing timeout 0.6.1
Fetching marcel 1.2.1
Installing marcel 1.2.1
Fetching mini_mime 1.1.5
Installing mini_mime 1.1.5
Fetching date 3.6.0
Installing date 3.6.0 with native extensions
Fetching i18n 1.15.2
Installing i18n 1.15.2
Fetching tzinfo 2.0.6
Installing tzinfo 2.0.6
Fetching nokogiri 1.19.4 (x86_64-linux-gnu)
Fetching pp 0.6.4
Installing pp 0.6.4
Fetching rack-session 2.1.2
Installing rack-session 2.1.2
Fetching rack-test 2.3.0
Fetching rackup 2.3.1
Installing rack-test 2.3.0
Installing rackup 2.3.1
Fetching websocket-driver 0.8.2
Fetching net-protocol 0.4.0
Installing net-protocol 0.4.0
Installing websocket-driver 0.8.2 with native extensions
Fetching reline 0.7.0
Installing reline 0.7.0
Installing nokogiri 1.19.4 (x86_64-linux-gnu)
Fetching minitest 6.0.6
Fetching rbs 4.2.0
Installing minitest 6.0.6
Installing rbs 4.2.0 with native extensions
Fetching net-pop 0.1.2
Installing net-pop 0.1.2
Fetching net-smtp 0.5.2
Installing net-smtp 0.5.2
Fetching net-imap 0.6.8
Fetching activesupport 8.1.4
Fetching loofah 2.25.2
Installing loofah 2.25.2
Fetching rails-html-sanitizer 1.7.1
Installing rails-html-sanitizer 1.7.1
Installing net-imap 0.6.8
Installing activesupport 8.1.4
Fetching mail 2.9.1
Fetching rails-dom-testing 2.3.0
Fetching globalid 1.4.0
Installing globalid 1.4.0
Installing rails-dom-testing 2.3.0
Fetching activemodel 8.1.4
Fetching activejob 8.1.4
Installing activejob 8.1.4
Fetching actionview 8.1.4
Installing activemodel 8.1.4
Fetching activerecord 8.1.4
Installing actionview 8.1.4
Fetching actionpack 8.1.4
Installing mail 2.9.1
Installing actionpack 8.1.4
Installing activerecord 8.1.4
Fetching actioncable 8.1.4
Installing actioncable 8.1.4
Fetching actionmailer 8.1.4
Installing actionmailer 8.1.4
Fetching rdoc 8.1.0
Installing rdoc 8.1.0
Fetching irb 1.18.0
Installing irb 1.18.0
Fetching railties 8.1.4
Installing railties 8.1.4
Fetching activestorage 8.1.4
Fetching action_text-trix 2.1.19
Installing action_text-trix 2.1.19
Installing activestorage 8.1.4
Fetching actionmailbox 8.1.4
Fetching actiontext 8.1.4
Installing actionmailbox 8.1.4
Installing actiontext 8.1.4
Fetching rails 8.1.4
Installing rails 8.1.4
Bundle complete! 1 Gemfile dependency, 66 gems now installed.
Bundled gems are installed into `./gems_no_injection_04`
31.508u 27.995s 8:11.94 12.0%	0+0k 104816+669552io 44pf+0w
seivdilc89057:~/sample_ruby_on_rails_project % 





TEST 02 - Flags applied:
# ruby
#^.*/(ruby|irb|gem|rake|bundle|bundler)$,0,~SK|NI
/opt/puppetlabs/puppet/bin/ruby,0,TR

seivdilc89057:~ % cd ~/sample_ruby_on_rails_project
seivdilc89057:~/sample_ruby_on_rails_project % mkdir /home/farivera/sample_ruby_on_rails_project/gems_no_injection_02
seivdilc89057:~/sample_ruby_on_rails_project % printf '%s\n' '---' 'BUNDLE_PATH: "/home/farivera/sample_ruby_on_rails_project/gems_no_injection_02"' > .bundle/config
seivdilc89057:~/sample_ruby_on_rails_project % 
seivdilc89057:~/sample_ruby_on_rails_project % cat .bundle/config
---
BUNDLE_PATH: "/home/farivera/sample_ruby_on_rails_project/gems_no_injection_02"
seivdilc89057:~/sample_ruby_on_rails_project % date -Is
2026-10-27T10:02:16+01:00
seivdilc89057:~/sample_ruby_on_rails_project % time bundle install
Fetching gem metadata from https://artifactory-it.asml.com/artifactory/api/gems/rubygems/.........
Fetching rake 13.4.2
Installing rake 13.4.2
Fetching base64 0.3.0
Fetching bigdecimal 4.1.3
Fetching concurrent-ruby 1.3.8
Fetching connection_pool 3.0.2
Installing base64 0.3.0
Fetching drb 2.2.3
Installing connection_pool 3.0.2
Fetching json 3.1.0
Installing drb 2.2.3
Fetching logger 1.7.0
Installing logger 1.7.0
Installing bigdecimal 4.1.3 with native extensions
Fetching prism 1.9.0
Installing json 3.1.0 with native extensions
Installing concurrent-ruby 1.3.8
Installing prism 1.9.0 with native extensions
Fetching securerandom 0.4.1
Installing securerandom 0.4.1
Fetching uri 1.1.2
Installing uri 1.1.2
Fetching builder 3.3.0
Installing builder 3.3.0
Fetching erubi 1.13.1
Installing erubi 1.13.1
Fetching racc 1.8.1
Installing racc 1.8.1 with native extensions
Fetching crass 1.0.8
Installing crass 1.0.8
Fetching rack 3.2.7
Installing rack 3.2.7
Fetching useragent 0.16.11
Installing useragent 0.16.11
Fetching prettyprint 0.2.1
Installing prettyprint 0.2.1
Fetching erb 6.0.7
Installing erb 6.0.7 with native extensions
Fetching tsort 0.2.0
Installing tsort 0.2.0
Fetching io-console 0.9.4
Installing io-console 0.9.4 with native extensions
Fetching thor 1.5.0
Installing thor 1.5.0
Fetching zeitwerk 2.8.3
Installing zeitwerk 2.8.3
Fetching nio4r 2.7.5
Fetching websocket-extensions 0.1.5
Installing websocket-extensions 0.1.5
Installing nio4r 2.7.5 with native extensions
Fetching timeout 0.6.1
Fetching marcel 1.2.1
Installing timeout 0.6.1
Fetching mini_mime 1.1.5
Installing mini_mime 1.1.5
Installing marcel 1.2.1
Fetching date 3.6.0
Installing date 3.6.0 with native extensions
Fetching i18n 1.15.2
Installing i18n 1.15.2
Fetching tzinfo 2.0.6
Installing tzinfo 2.0.6
Fetching nokogiri 1.19.4 (x86_64-linux-gnu)
Fetching rack-session 2.1.2
Installing rack-session 2.1.2
Fetching rack-test 2.3.0
Installing rack-test 2.3.0
Installing nokogiri 1.19.4 (x86_64-linux-gnu)
Fetching rackup 2.3.1
Installing rackup 2.3.1
Fetching pp 0.6.4
Installing pp 0.6.4
Fetching minitest 6.0.6
Installing minitest 6.0.6
Fetching rbs 4.2.0
Installing rbs 4.2.0 with native extensions
Fetching websocket-driver 0.8.2
Installing websocket-driver 0.8.2 with native extensions
Fetching net-protocol 0.4.0
Installing net-protocol 0.4.0
Fetching reline 0.7.0
Installing reline 0.7.0
Fetching activesupport 8.1.4
Fetching net-imap 0.6.8
Fetching net-pop 0.1.2
Installing net-pop 0.1.2
Fetching net-smtp 0.5.2
Installing net-smtp 0.5.2
Fetching loofah 2.25.2
Installing loofah 2.25.2
Fetching rails-html-sanitizer 1.7.1
Installing rails-html-sanitizer 1.7.1
Installing net-imap 0.6.8
Installing activesupport 8.1.4
Fetching mail 2.9.1
Fetching rails-dom-testing 2.3.0
Fetching globalid 1.4.0
Installing globalid 1.4.0
Fetching activemodel 8.1.4
Installing rails-dom-testing 2.3.0
Fetching activejob 8.1.4
Installing activejob 8.1.4
Installing activemodel 8.1.4
Fetching actionview 8.1.4
Fetching activerecord 8.1.4
Installing actionview 8.1.4
Installing mail 2.9.1
Fetching actionpack 8.1.4
Installing actionpack 8.1.4
Installing activerecord 8.1.4
Fetching actionmailer 8.1.4
Fetching actioncable 8.1.4
Installing actionmailer 8.1.4
Installing actioncable 8.1.4
Fetching activestorage 8.1.4
Installing activestorage 8.1.4
Fetching actionmailbox 8.1.4
Installing actionmailbox 8.1.4
Fetching rdoc 8.1.0
Installing rdoc 8.1.0
Fetching irb 1.18.0
Installing irb 1.18.0
Fetching railties 8.1.4
Installing railties 8.1.4
Fetching action_text-trix 2.1.19
Installing action_text-trix 2.1.19
Fetching actiontext 8.1.4
Installing actiontext 8.1.4
Fetching rails 8.1.4
Installing rails 8.1.4
Bundle complete! 1 Gemfile dependency, 66 gems now installed.
Bundled gems are installed into `./gems_no_injection_02`
31.420u 65.955s 8:42.96 18.6%	0+0k 122240+669432io 37pf+0w



TEST 03 - Flags applied:
# ruby
#^.*/(ruby|irb|gem|rake|bundle|bundler)$,0,~SK|NI
#/opt/puppetlabs/puppet/bin/ruby,0,TR:

seivdilc89057:~ % 
seivdilc89057:~ % 
seivdilc89057:~ % cd ~/sample_ruby_on_rails_project
seivdilc89057:~/sample_ruby_on_rails_project % mkdir /home/farivera/sample_ruby_on_rails_project/gems_no_injection_03
seivdilc89057:~/sample_ruby_on_rails_project % printf '%s\n' '---' 'BUNDLE_PATH: "/home/farivera/sample_ruby_on_rails_project/gems_no_injection_03"' > .bundle/config
seivdilc89057:~/sample_ruby_on_rails_project % cat .bundle/config
---
BUNDLE_PATH: "/home/farivera/sample_ruby_on_rails_project/gems_no_injection_03"
seivdilc89057:~/sample_ruby_on_rails_project % 
seivdilc89057:~/sample_ruby_on_rails_project % date -Is
2026-10-27T10:19:40+01:00
seivdilc89057:~/sample_ruby_on_rails_project % time bundle install
Fetching gem metadata from https://artifactory-it.asml.com/artifactory/api/gems/rubygems/.........
Fetching rake 13.4.2
Installing rake 13.4.2
Fetching base64 0.3.0
Fetching bigdecimal 4.1.3
Fetching connection_pool 3.0.2
Fetching concurrent-ruby 1.3.8
Installing base64 0.3.0
Installing bigdecimal 4.1.3 with native extensions
Installing connection_pool 3.0.2
Fetching drb 2.2.3
Installing drb 2.2.3
Installing concurrent-ruby 1.3.8
Fetching json 3.1.0
Installing json 3.1.0 with native extensions
Fetching logger 1.7.0
Installing logger 1.7.0
Fetching prism 1.9.0
Fetching securerandom 0.4.1
Installing securerandom 0.4.1
Installing prism 1.9.0 with native extensions
Fetching uri 1.1.2
Installing uri 1.1.2
Fetching builder 3.3.0
Installing builder 3.3.0
Fetching erubi 1.13.1
Installing erubi 1.13.1
Fetching racc 1.8.1
Installing racc 1.8.1 with native extensions
Fetching crass 1.0.8
Installing crass 1.0.8
Fetching rack 3.2.7
Installing rack 3.2.7
Fetching useragent 0.16.11
Installing useragent 0.16.11
Fetching prettyprint 0.2.1
Installing prettyprint 0.2.1
Fetching erb 6.0.7
Installing erb 6.0.7 with native extensions
Fetching tsort 0.2.0
Installing tsort 0.2.0
Fetching io-console 0.9.4
Installing io-console 0.9.4 with native extensions
Fetching thor 1.5.0
Installing thor 1.5.0
Fetching zeitwerk 2.8.3
Installing zeitwerk 2.8.3
Fetching nio4r 2.7.5
Installing nio4r 2.7.5 with native extensions
Fetching websocket-extensions 0.1.5
Installing websocket-extensions 0.1.5
Fetching timeout 0.6.1
Installing timeout 0.6.1
Fetching marcel 1.2.1
Installing marcel 1.2.1
Fetching mini_mime 1.1.5
Installing mini_mime 1.1.5
Fetching date 3.6.0
Installing date 3.6.0 with native extensions
Fetching i18n 1.15.2
Installing i18n 1.15.2
Fetching tzinfo 2.0.6
Installing tzinfo 2.0.6
Fetching nokogiri 1.19.4 (x86_64-linux-gnu)
Installing nokogiri 1.19.4 (x86_64-linux-gnu)
Fetching rack-session 2.1.2
Installing rack-session 2.1.2
Fetching rack-test 2.3.0
Installing rack-test 2.3.0
Fetching rackup 2.3.1
Installing rackup 2.3.1
Fetching pp 0.6.4
Installing pp 0.6.4
Fetching reline 0.7.0
Installing reline 0.7.0
Fetching websocket-driver 0.8.2
Installing websocket-driver 0.8.2 with native extensions
Fetching net-protocol 0.4.0
Installing net-protocol 0.4.0
Fetching loofah 2.25.2
Installing loofah 2.25.2
Fetching net-pop 0.1.2
Installing net-pop 0.1.2
Fetching net-smtp 0.5.2
Installing net-smtp 0.5.2
Fetching rails-html-sanitizer 1.7.1
Installing rails-html-sanitizer 1.7.1
Fetching net-imap 0.6.8
Installing net-imap 0.6.8
Fetching mail 2.9.1
Installing mail 2.9.1
Fetching minitest 6.0.6
Fetching rbs 4.2.0
Installing minitest 6.0.6
Installing rbs 4.2.0 with native extensions
Fetching activesupport 8.1.4
Installing activesupport 8.1.4
Fetching globalid 1.4.0
Fetching rails-dom-testing 2.3.0
Fetching activemodel 8.1.4
Installing globalid 1.4.0
Installing rails-dom-testing 2.3.0
Installing activemodel 8.1.4
Fetching activejob 8.1.4
Installing activejob 8.1.4
Fetching actionview 8.1.4
Installing actionview 8.1.4
Fetching activerecord 8.1.4
Installing activerecord 8.1.4
Fetching actionpack 8.1.4
Installing actionpack 8.1.4
Fetching actioncable 8.1.4
Fetching actionmailer 8.1.4
Installing actioncable 8.1.4
Installing actionmailer 8.1.4
Fetching activestorage 8.1.4
Installing activestorage 8.1.4
Fetching actionmailbox 8.1.4
Installing actionmailbox 8.1.4
Fetching rdoc 8.1.0
Installing rdoc 8.1.0
Fetching irb 1.18.0
Installing irb 1.18.0
Fetching railties 8.1.4
Installing railties 8.1.4
Fetching action_text-trix 2.1.19
Installing action_text-trix 2.1.19
Fetching actiontext 8.1.4
Installing actiontext 8.1.4
Fetching rails 8.1.4
Installing rails 8.1.4
Bundle complete! 1 Gemfile dependency, 66 gems now installed.
Bundled gems are installed into `./gems_no_injection_03`
34.581u 5.166s 0:30.76 129.1%	0+0k 171648+667008io 67pf+0w





Esto fue sin DG:

seivdilc89057:~ % 
seivdilc89057:~ % cadenv -t ruby
 Installing ruby 3.4.7
seivdilc89057:~ % cd ~/sample_ruby_on_rails_project
seivdilc89057:~/sample_ruby_on_rails_project % cp -n .bundle/config .bundle/config.before_timing_test
seivdilc89057:~/sample_ruby_on_rails_project % mkdir "$HOME/sample_ruby_on_rails_project/gems_no_injection_01"
seivdilc89057:~/sample_ruby_on_rails_project % printf '%s\n' '---' "BUNDLE_PATH: \"$HOME/sample_ruby_on_rails_project/gems_no_injection_01\"" > .bundle/config
Unmatched '"'.
seivdilc89057:~/sample_ruby_on_rails_project % cat.bundle/config
cat.bundle/config: Command not found.
seivdilc89057:~/sample_ruby_on_rails_project % 
seivdilc89057:~/sample_ruby_on_rails_project % cat .bundle/config 
---
BUNDLE_PATH: "/home/farivera/.bundle"
seivdilc89057:~/sample_ruby_on_rails_project % 
seivdilc89057:~/sample_ruby_on_rails_project % date -Is
2026-10-27T09:56:43+01:00
seivdilc89057:~/sample_ruby_on_rails_project % 
seivdilc89057:~/sample_ruby_on_rails_project % time bundle install
Bundle complete! 1 Gemfile dependency, 66 gems now installed.
Bundled gems are installed into `/home/farivera/.bundle`
0.319u 1.529s 0:30.87 5.9%	0+0k 15440+8io 105pf+0w
seivdilc89057:~/sample_ruby_on_rails_project % 



Al iniciar
seivdilc89057:~/sample_ruby_on_rails_project % date -Is
2026-10-27T09:38:49+01:00

Al terminar
seivdilc89057:~/sample_ruby_on_rails_project % date -Is
2026-10-27T09:47:37+01:00
