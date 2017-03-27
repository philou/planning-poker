task :integrate => ['db:drop', 'db:create', 'db:migrate', 'default']
