cflags{
	'-Wall',
	'-D FT2_BUILD_LIBRARY',
	'-D FT_CONFIG_OPTION_SYSTEM_ZLIB',
	'-D HAVE_FCNTL_H',
	'-D HAVE_STDINT_H',
	'-D HAVE_UNISTD_H',
	'-I $srcdir/builds/unix',
	'-I $srcdir/include/freetype/config',
	'-I $srcdir/include',
	'-I $builddir/pkg/zlib/include',
}

cc('src/gzip/ftgzip.c', {'pkg/zlib/headers'})
lib('libfreetype.a', [[
	builds/unix/ftsystem.c
	src/(
		base/(
			ftdebug.c ftinit.c ftbase.c
			ftbbox.c ftbdf.c ftbitmap.c ftcid.c ftfstype.c ftgasp.c
			ftglyph.c ftgxval.c ftmm.c ftotval.c ftpatent.c ftpfr.c
			ftstroke.c ftsynth.c fttype1.c ftwinfnt.c
		)
		truetype/truetype.c
		type1/type1.c
		cff/cff.c
		cid/type1cid.c
		pfr/pfr.c
		type42/type42.c
		winfonts/winfnt.c
		pcf/pcf.c
		bdf/bdf.c
		sfnt/sfnt.c

		autofit/autofit.c
		pshinter/pshinter.c

		raster/raster.c
		smooth/smooth.c

		cache/ftcache.c
		gzip/ftgzip.c.o
		lzw/ftlzw.c
		bzip2/ftbzip2.c
		psaux/psaux.c
		psnames/psnames.c
	)
	$builddir/pkg/zlib/libz.a
]])

fetch 'git'
