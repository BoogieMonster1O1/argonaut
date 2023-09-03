argonaut_sources = [
  'main.vala',
  'application.vala',
  'window.vala',
]

argonaut_deps = [
  dependency('gtk4'),
  dependency('gio-2.0', version: '>=2.0'),
  dependency('libadwaita-1', version: '>= 1.2'),
]

argonaut_sources += gnome.compile_resources('argonaut-resources',
  'argonaut.gresource.xml',
  c_name: 'argonaut'
)

executable('argonaut', argonaut_sources,
  dependencies: argonaut_deps,
       install: true,
)
