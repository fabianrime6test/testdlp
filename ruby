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
