-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 07, 2013 at 02:35 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `myplumon`
--
CREATE DATABASE IF NOT EXISTS `myplumon` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `myplumon`;

-- --------------------------------------------------------

--
-- Table structure for table `cursos`
--

CREATE TABLE IF NOT EXISTS `cursos` (
  `id_curso` varchar(255) NOT NULL,
  `nombre` text NOT NULL,
  `estado` int(1) NOT NULL,
  `imagen_curso` text,
  `id_docente` varchar(255) NOT NULL,
  `id_periodos` varchar(255) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `id_noticias` varchar(255) DEFAULT NULL,
  `id_comentarios` varchar(255) DEFAULT NULL,
  `abierto` int(11) NOT NULL,
  PRIMARY KEY (`id_curso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cursos`
--

INSERT INTO `cursos` (`id_curso`, `nombre`, `estado`, `imagen_curso`, `id_docente`, `id_periodos`, `fecha_inicio`, `id_noticias`, `id_comentarios`, `abierto`) VALUES
('c++ 222', 'c++ avanzado', 1, '1704153589_17041535891704153589.jpeg', 'QfNmXIg+KDIhxILQazJMzmEBRIoB6kNL94mWeHcQRI0=', 'UnZvDhmiKr53UfE3dYyMGQ==', '2013-10-23', NULL, NULL, 1),
('calc888', 'calculo 2 ', 1, '1987741334_19877413341987741334.jpeg', 'QfNmXIg+KDIhxILQazJMzmEBRIoB6kNL94mWeHcQRI0=', 'DHMJAwTH0SBQV1oXSEikxg==', '2013-10-23', NULL, NULL, 0),
('clas222', 'clases de c++', 1, '732003928_732003928732003928.jpeg', 'QfNmXIg+KDIhxILQazJMzmEBRIoB6kNL94mWeHcQRI0=', '0/bNjEIk//pnDkTJZcIMKQ==', '2013-10-23', NULL, NULL, 0),
('cpp 777', 'cpp curso', 1, '1786119601_17861196011786119601.jpeg', 'QfNmXIg+KDIhxILQazJMzmEBRIoB6kNL94mWeHcQRI0=', 'Zbb2iCeIt4RN9Uuu8rVKpA==', '2013-10-22', NULL, NULL, 1),
('curso_asp_500', 'ASP.NET', 1, 'curso1.jpg', 'pumVwazCGFwB9KytZkhzpcgc2S1p1T7Oy5lVR0soR3o=', 'periodo__', '2013-09-19', NULL, NULL, 0),
('fisica400', 'Fisica II', 1, '1504430674_15044306741504430674.jpeg', 'pumVwazCGFwB9KytZkhzpcgc2S1p1T7Oy5lVR0soR3o=', 'hDaoH7Pa03HyxAhw58YbRw==', '2013-10-23', NULL, NULL, 0),
('java444', 'javascript', 1, '1217213406_12172134061217213406.png', 'pumVwazCGFwB9KytZkhzpcgc2S1p1T7Oy5lVR0soR3o=', 'UyFk3nav4tKGtl2Lw99Ipw==', '2013-10-18', NULL, NULL, 1),
('mate666', 'matematica III', 1, '1538322747_15383227471538322747.jpeg', 'pumVwazCGFwB9KytZkhzpcgc2S1p1T7Oy5lVR0soR3o=', 'FKn9cBbb7HPV4LkemNFaZQ==', '2013-10-23', NULL, NULL, 0),
('php3841', 'php', 1, '1914596960_19145969601914596960.jpeg', 'pumVwazCGFwB9KytZkhzpcgc2S1p1T7Oy5lVR0soR3o=', 'qIEG6SyknMghbDe2HhHzkw==', '2013-10-17', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `documentos_cursos`
--

CREATE TABLE IF NOT EXISTS `documentos_cursos` (
  `id_documentos` varchar(255) NOT NULL,
  `id_periodo` varchar(255) NOT NULL,
  `comentario` text,
  `titulo` text NOT NULL,
  `archivo` text,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_documentos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `documentos_cursos`
--

INSERT INTO `documentos_cursos` (`id_documentos`, `id_periodo`, `comentario`, `titulo`, `archivo`, `fecha`) VALUES
('4n7C/jXjiEipS60lLrf4lHdf2DlG1gI335mXWaDopvA=', 'vcVaijpsX4sf9cQCUKS/Zp/2cs0YbKMXqxZgDRm2GaBWXcf9kDzjaPqequs7ASP1', '<h1>descarga el libro en pdf de javascript</h1>\r\n<p>&nbsp;</p>\r\n<p style="text-align: center;"><a href="http://dis.um.es/~lopezquesada/documentos/IES_1213/LMSGI/curso/UT6/libroswebjavascript/www.librosweb.es/javascript/pdf/introduccion_javascript.pdf"><img src="http://dis.um.es/~lopezquesada/documentos/IES_1213/LMSGI/curso/UT6/libroswebjavascript/www.librosweb.es/website/css/images/libro1cara.png" alt="" width="140" height="161" /></a></p>\r\n<p style="text-align: center;">click imagen para descargar</p>', 'LIBRO JAVASCRIPT', 'NULL', '0000-00-00'),
('67b5jmhTG1/nxqN+khVYw5jeGP/egC5zaAmwOG74R0w=', 'vcVaijpsX4sf9cQCUKS/Zp/2cs0YbKMXqxZgDRm2GaBWXcf9kDzjaPqequs7ASP1', '<p>Modificar el primer script para que:</p>\r\n<ol>\r\n<li>Todo el c&oacute;digo JavaScript se encuentre en un archivo externo llamado <code>codigo.js</code> y el script siga funcionando de la misma manera.</li>\r\n<li>Despu&eacute;s del primer mensaje, se debe mostrar otro mensaje que diga <em>"Soy el primer script"</em></li>\r\n<li>A&ntilde;adir algunos comentarios que expliquen el funcionamiento del c&oacute;digo</li>\r\n<li>A&ntilde;adir en la p&aacute;gina XHTML un mensaje de aviso para los navegadores que no tengan activado el soporte de JavaScript</li>\r\n</ol>\r\n<p><a href="http://www.librosweb.es/javascript/capitulo_11.html"><br /></a></p>\r\n<p style="text-align: center;"><a href="http://www.librosweb.es/javascript/capitulo_11.html">Ver solucion</a></p>\r\n<ol> </ol>', 'ejercicios', 'NULL', '0000-00-00'),
('67b5jmhTG1/nxqN+khVYwxxZMi5wfUP8pHDqks//3sA=', 'x8tmV7V2SQgPU+gseFB15Gijfg6DDgxbR2iKpI9qZdw=', '<h4><span class="clase2" style="font-family: arial,helvetica,sans-serif; font-size: small;">EDITOR JAVASCRIP PARA QUE COMIENCEN A PROBAR SUS PROGRAMAS DE UNA FORMA FACIL</span></h4>\r\n<p>&nbsp;</p>\r\n<p><a href="http://www.w3schools.com/js/tryit.asp?filename=tryjs_events">http://www.w3schools.com/js/tryit.asp?filename=tryjs_events</a></p>', 'Editor javascrip online', 'NULL', '2013-11-01'),
('76kEct+615osqeD8se0H3eDuLmicPNYhKLKFJE3Cb9c=', 'Wq0JTVQ8EVIcVYoupdPc0+UxUiLPLuaqbLewwE+utqM=', '<p>Vamos a ver ahora como se utiliza el m&eacute;todo de doble integraci&oacute;n para  calcular el &aacute;rea o el centro de gravedad de una regi&oacute;n A, limitada  superiormente por la curva <em>y=f</em><em>2</em><em>(x), </em>inferiormente de <em>y=f</em><em>1</em><em>(x)</em>, a la izquierda por la recta <em>x=a</em> y a la derecha por <em>x=b.</em> pero es de considerar aplicaciones concretas, vamos a procesar el concepto de integral doble de una funci&oacute;n <em>F(x,y)</em> de dos variables <em>x </em> e <em>y</em>. Las aplicaciones f&iacute;sicas resultan inmediatamente eligiendo expresiones particulares para <em>F(x,y);</em> esto es,</p>\r\n<p><em> F(x,y)= 1, o</em></p>\r\n<p><em> F(x,y)= y,</em></p>\r\n<p>Cuando se trate de calcular el &aacute;rea,</p>\r\n<p>o el momento del &aacute;rea respecto al eje x.</p>\r\n<p>La notaci&oacute;n</p>\r\n<p style="text-align: center;"><em>"</em><em>A</em><em>"</em><em> F(x, y)dA </em>(1)</p>\r\n<p>Ahora para designar la integral doble, extendida a la regi&oacute;n A, de la funci&oacute;n <em>F(x,y).</em> Imagin&eacute;monos la regi&oacute;n A cubierta por una red de rectas paralelas a los ejes <em>x</em> e <em>y.</em> Estas rectas dividen al plano en peque&ntilde;as &aacute;reas rectangulares,</p>\r\n<p style="text-align: center;"><em></em><em>A=</em><em></em><em>x</em><em></em><em>y=</em><em></em><em>y</em><em></em><em>x</em> (2)</p>\r\n<p>algunas  de las cuales yacen por completo en la regi&oacute;n A, otra son exteriores y  otras, finalmente, quedan atravesadas por su contorno. No tendremos  pendientes las que est&aacute;n de <em>A </em>y podemos tomar o no en consideraci&oacute;n aquellas que se hayan parcialmente dentro. Concretamente, fijemos la atenci&oacute;n en <em></em><em>A</em> interiores al contorno que numeramos en cierto orden</p>\r\n<p style="text-align: center;"><em></em><em></em></p>', 'Integrales dobles (introduccion)', 'NULL', '0000-00-00'),
('BBeNAPMPfkSSchF3olHfH7h/Hcv/KLSsAAIvq5dl4gs=', '5suPhNCuR5pLRovCPc2DRjS753KxEcd8+f7K5etzuIY=', '<p>El <strong>campo el&eacute;ctrico</strong> es un <a title="Campo (f&iacute;sica)" href="http://es.wikipedia.org/wiki/Campo_%28f%C3%ADsica%29">campo f&iacute;sico</a> que es representado mediante un <a title="Modelo f&iacute;sico" href="http://es.wikipedia.org/wiki/Modelo_f%C3%ADsico">modelo</a> que describe la interacci&oacute;n entre cuerpos y sistemas con propiedades de naturaleza <a title="Electricidad" href="http://es.wikipedia.org/wiki/Electricidad">el&eacute;ctrica</a>.<sup id="cite_ref-griffiths_1-0" class="reference"><a href="http://es.wikipedia.org/wiki/Campo_el%C3%A9ctrico#cite_note-griffiths-1">1</a></sup> Se describe como un <a title="Campo vectorial" href="http://es.wikipedia.org/wiki/Campo_vectorial">campo vectorial</a> en el cual una <a title="Carga el&eacute;ctrica" href="http://es.wikipedia.org/wiki/Carga_el%C3%A9ctrica">carga el&eacute;ctrica</a> puntual de valor <img class="tex" src="http://upload.wikimedia.org/math/7/6/9/7694f4a66316e53c8cdd9d9954bd611d.png" alt="q" /> sufre los efectos de una <a title="Fuerza" href="http://es.wikipedia.org/wiki/Fuerza">fuerza</a> el&eacute;ctrica <img class="tex" src="http://upload.wikimedia.org/math/1/7/b/17b940fa61bdbd871c96510260498641.png" alt="vec F" /> dada por la siguiente ecuaci&oacute;n:</p>\r\n<blockquote style="padding: 5px 10px; background-color: white; color: black; text-align: left; margin-left: 30px; margin-bottom: 0.4em; margin-top: 0.2em; min-width: 50%;">\r\n<p><span style="float: right; width: 10%; text-align: right;">(<cite id="Equation_1" style="font-style: normal;"><a href="http://es.wikipedia.org/wiki/Campo_el%C3%A9ctrico#Eqnref_1">1</a></cite>)</span></p>\r\n<p><img class="tex" src="http://upload.wikimedia.org/math/5/7/7/577aed76b38ca8ef0c028d3e54816652.png" alt="vec F = q vec E" /></p>\r\n</blockquote>\r\n<p>En los modelos relativistas actuales, el campo el&eacute;ctrico se incorpora, junto con el <a title="Campo magn&eacute;tico" href="http://es.wikipedia.org/wiki/Campo_magn%C3%A9tico">campo magn&eacute;tico</a>, en <a title="Campo tensorial" href="http://es.wikipedia.org/wiki/Campo_tensorial">campo tensorial</a> cuadridimensional, denominado <a title="Campo electromagn&eacute;tico" href="http://es.wikipedia.org/wiki/Campo_electromagn%C3%A9tico">campo electromagn&eacute;tico</a> <em>F</em><sup>&mu;&nu;</sup>.<sup id="cite_ref-landau_2-0" class="reference"><a href="http://es.wikipedia.org/wiki/Campo_el%C3%A9ctrico#cite_note-landau-2">2</a></sup></p>\r\n<p>Los campos el&eacute;ctricos pueden tener su origen tanto en <a title="Carga el&eacute;ctrica" href="http://es.wikipedia.org/wiki/Carga_el%C3%A9ctrica">cargas el&eacute;ctricas</a> como en <a title="Campo magn&eacute;tico" href="http://es.wikipedia.org/wiki/Campo_magn%C3%A9tico">campos magn&eacute;ticos</a> variables. Las primeras descripciones de los fen&oacute;menos el&eacute;ctricos, como la <a title="Ley de Coulomb" href="http://es.wikipedia.org/wiki/Ley_de_Coulomb">ley de Coulomb</a>, s&oacute;lo ten&iacute;an en cuenta las cargas el&eacute;ctricas, pero las investigaciones de <a title="Michael Faraday" href="http://es.wikipedia.org/wiki/Michael_Faraday">Michael Faraday</a> y los estudios posteriores de <a title="James Clerk Maxwell" href="http://es.wikipedia.org/wiki/James_Clerk_Maxwell">James Clerk Maxwell</a> permitieron establecer las leyes completas en las que tambi&eacute;n se tiene en cuenta la variaci&oacute;n del <a title="Campo magn&eacute;tico" href="http://es.wikipedia.org/wiki/Campo_magn%C3%A9tico">campo magn&eacute;tico</a>.</p>\r\n<p>Esta definici&oacute;n general indica que el campo no es directamente <a title="Medici&oacute;n" href="http://es.wikipedia.org/wiki/Medici%C3%B3n">medible</a>,  sino que lo que es observable es su efecto sobre alguna carga colocada  en su seno. La idea de campo el&eacute;ctrico fue propuesta por Faraday al  demostrar el principio de <a title="Inducci&oacute;n electromagn&eacute;tica" href="http://es.wikipedia.org/wiki/Inducci%C3%B3n_electromagn%C3%A9tica">inducci&oacute;n electromagn&eacute;tica</a> en el a&ntilde;o <a title="1832" href="http://es.wikipedia.org/wiki/1832">1832</a>.</p>\r\n<p>La unidad del campo el&eacute;ctrico en el <a title="Sistema Internacional de Unidades" href="http://es.wikipedia.org/wiki/Sistema_Internacional_de_Unidades">SI</a> es <a title="Newton (unidad)" href="http://es.wikipedia.org/wiki/Newton_%28unidad%29">Newton</a> por <a title="Culombio" href="http://es.wikipedia.org/wiki/Culombio">Culombio</a> (N/C), <a title="Voltio" href="http://es.wikipedia.org/wiki/Voltio">Voltio</a> por metro (V/m) o, en unidades b&aacute;sicas, <a title="Kilogramo" href="http://es.wikipedia.org/wiki/Kilogramo">kg</a>&middot;<a title="Metro" href="http://es.wikipedia.org/wiki/Metro">m</a>&middot;<a title="Segundo" href="http://es.wikipedia.org/wiki/Segundo">s</a><sup>&minus;3</sup>&middot;<a title="Amperio" href="http://es.wikipedia.org/wiki/Amperio">A</a><sup>&minus;1</sup> y la ecuaci&oacute;n dimensional es MLT<sup>-3</sup>I<sup>-1</sup>.</p>', 'campos electricos', 'NULL', '0000-00-00'),
('C0z4JssjhmulScRAgxjj5dsjrBU/xB3BvwEhIidw2tI=', 'AKDgl30h25iCTzKN6Gt9yBcP1PG6pQnfyUuqR5bpbI=', '<blockquote>\r\n<p style="text-align: center;"><a href="http://www.asp.net/">http://www.asp.net/</a></p>\r\n</blockquote>', 'pagina oficial de asp ', 'NULL', '0000-00-00'),
('CmgIq15Y0DLW+2ASjnvG59tb6sYLUWICb0XQAE4Wnq8=', 'oC7XZIo9ribDZTq08jIOtc7/5DZYUpBJfzvFxi6iW8M=', '<p style="margin: 0.4em 0px 0.5em; line-height: 19.1875px; color: #252525; font-family: sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px;">Si se desea escribir un programa en C++ se debe ejecutar como m&iacute;nimo los siguientes pasos:</p>\r\n<ol style="line-height: 19.1875px; margin: 0.3em 0px 0px 3.2em; padding: 0px; list-style-image: none; color: #252525; font-family: sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px;">\r\n<li style="margin-bottom: 0.1em;">Escribir con un editor de texto plano un programa sint&aacute;cticamente v&aacute;lido o usar un entorno de desarrollo (IDE) apropiado para tal fin</li>\r\n<li style="margin-bottom: 0.1em;">Compilar el programa y asegurarse de que no han habido errores de compilaci&oacute;n</li>\r\n<li style="margin-bottom: 0.1em;">Ejecutar el programa y comprobar que no hay errores de ejecuci&oacute;n</li>\r\n</ol>\r\n<p style="margin: 0.4em 0px 0.5em; line-height: 19.1875px; color: #252525; font-family: sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px;">Este &uacute;ltimo paso es el m&aacute;s costoso, por que en programas grandes, averiguar si hay o no un fallo pr&aacute;cticamente puede ser una tarea tot&eacute;mica.</p>\r\n<p style="margin: 0.4em 0px 0.5em; line-height: 19.1875px; color: #252525; font-family: sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px;">Como ejemplo, si se desea escribir un archivo con el nombre hola.cpp y en &eacute;l escribir un programa con emacs, por ejemplo, que es un programa de edici&oacute;n de textos, se puede, en Linux, ejecutar el siguiente comando:</p>\r\n<pre style="font-family: monospace, Courier; padding: 1em; border: 1px solid #dddddd; color: black; background-color: #f9f9f9; line-height: 1.3em; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: justify; text-indent: 0px; text-transform: none; widows: auto; word-spacing: 0px;">$emacs hola.cpp &amp;\r\n</pre>\r\n<p>&nbsp;</p>', 'definamos un poco de c++', 'NULL', '2013-10-30'),
('DlFPUwceKtZBDE2pvFvUP25XYFsiBgKXQdkckAPKzpA=', 'y7cC1v93VTEChY7TyKA/+N4rxEPKBoIA3JPNG1aNT30=', '<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p><a href="http://www.tecnun.es/asignaturas/Informat1/AyudaInf/aprendainf/cpp/avanzado/cppavan.pdf"><img src="data:image/jpeg;base64,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" alt="" width="233" height="216" /></a></p>\r\n<p><a href="http://www.tecnun.es/asignaturas/Informat1/AyudaInf/aprendainf/cpp/avanzado/cppavan.pdf"></a></p>', 'libro pedf c++ avanzado como si estuviera en primero', 'NULL', '2013-10-30'),
('GmFwCGWbd4t9v8N6sUHc7FifPV9dM7d/yBnsE3t/B3Y=', 'vcVaijpsX4sf9cQCUKS/Zp/2cs0YbKMXqxZgDRm2GaBWXcf9kDzjaPqequs7ASP1', '<div class="code html">\r\n<pre class="html5"><cite title="script"><span class="sc0">&lt;!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"&gt;</span>\r\n<span class="sc2">&lt;<span class="kw2">html</span> xmlns<span class="sy0">=</span><span class="st0">"http://www.w3.org/1999/xhtml"</span>&gt;</span>\r\n<span class="sc2">&lt;<span class="kw2">head</span>&gt;</span>\r\n<span class="sc2">&lt;<span class="kw2">meta</span> <span class="kw3">http-equiv</span><span class="sy0">=</span><span class="st0">"Content-Type"</span> <span class="kw3">content</span><span class="sy0">=</span><span class="st0">"text/html; charset=iso-8859-1"</span> <span class="sy0">/</span>&gt;</span>\r\n<span class="sc2">&lt;<span class="kw2">title</span>&gt;</span>El primer script<span class="sc2">&lt;<span class="sy0">/</span><span class="kw2">title</span>&gt;</span>\r\n&nbsp;\r\n<span class="sc2">&lt;<span class="kw2">script</span> <span class="kw3">type</span><span class="sy0">=</span><span class="st0">"text/javascript"</span>&gt;</span>\r\n  alert("Hola Mundo!");\r\n<span class="sc2">&lt;<span class="sy0">/</span><span class="kw2">script</span>&gt;</span>\r\n<span class="sc2">&lt;<span class="sy0">/</span><span class="kw2">head</span>&gt;</span>\r\n&nbsp;\r\n<span class="sc2">&lt;<span class="kw2">body</span>&gt;</span>\r\n<span class="sc2">&lt;<span class="kw2">p</span>&gt;</span>Esta p&aacute;gina contiene el primer script<span class="sc2">&lt;<span class="sy0">/</span><span class="kw2">p</span>&gt;</span>\r\n<span class="sc2">&lt;<span class="sy0">/</span><span class="kw2">body</span>&gt;</span>\r\n<span class="sc2">&lt;<span class="sy0">/</span><span class="kw2">html</span>&gt;</span></cite></pre>\r\n</div>', 'El primer script', 'NULL', '0000-00-00'),
('gnhH41R5ZxUE1/XQPTyAg1oe9BVuv7F347ebZjE46zA=', 'Wq0JTVQ8EVIcVYoupdPc0+UxUiLPLuaqbLewwE+utqM=', '<p>hola</p>\r\n<p>&nbsp;</p>', 'Integrales dobles (introduccion)', 'NULL', '0000-00-00'),
('GPOmFgrTsDhhoKgTlXmwB2RSXPKFACvF9qahmMqwV3E=', 'y7cC1v93VTEChY7TyKA/+N4rxEPKBoIA3JPNG1aNT30=', '<p style="margin: 9px 0px; padding: 0px; line-height: 2.34rem; color: #333333; font-family: Tahoma, Arial, Verdana, sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; background-color: #ffffff;">Dev-C++ es un entorno de desarrollo para los lenguajes C y C++. Adem&aacute;s del consabido editor, a&ntilde;ade un compilador y otras utilidades menos evidentes que lo convierten en un gran aliado en la programaci&oacute;n.</p>\r\n<p style="margin: 9px 0px; padding: 0px; line-height: 2.34rem; color: #333333; font-family: Tahoma, Arial, Verdana, sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; background-color: #ffffff;"><strong>DAR CLICK EN ICONO DEV PARA DESCARGAR</strong></p>\r\n<p style="margin: 9px 0px; padding: 0px; line-height: 2.34rem; color: #333333; font-family: Tahoma, Arial, Verdana, sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; background-color: #ffffff;"><img src="http://imagenes.es.sftcdn.net/es/scrn/8000/8765/dev-c-19.png" alt="" width="100" height="100" /></p>', 'Entorno de programación y compilador de C y C++', 'NULL', '2013-10-30'),
('GVoOnzwqccPamYFQ0L7pkyLlyAOwaArYn3vEL7LZirc=', 'x8tmV7V2SQgPU+gseFB15Gijfg6DDgxbR2iKpI9qZdw=', '<p>&lt;!DOCTYPE html&gt;<br />&lt;html&gt;<br /> &lt;body&gt;<br /> <br /> &lt;h1&gt;My First Web Page&lt;/h1&gt;<br /> <br /> &lt;p <span class="marked">id="demo"</span>&gt;My  	First Paragraph&lt;/p&gt;<br /> <br /> <span class="marked">&lt;script&gt;<br /> document.getElementById("demo").innerHTML="My  	First JavaScript";<br /> &lt;/script&gt;</span><br /> <br /> &lt;/body&gt;<br /> &lt;/html&gt;</p>', 'Iniciando JS', 'NULL', '2013-11-01'),
('h3yxMOOvkozWOayNNQ8ZB/NDfjpfAn+OsZI8734UfXA=', 'AKDgl30h25iCTzKN6Gt9yBcP1PG6pQnfyUuqR5bpbI=', '<p>\r\n<object width="425" height="350" data="http://www.youtube.com/v/3-hVspOaGS8" type="application/x-shockwave-flash">\r\n<param name="src" value="http://www.youtube.com/v/3-hVspOaGS8" />\r\n</object>\r\n</p>\r\n<p>&nbsp;</p>', 'VIdeo ilustrativo asp.net y mysql', 'NULL', '2013-10-25'),
('JbATmls+wU19Yka8B928bMMw1aju2xmMVGrrUottfms=', 'AKDgl30h25iCTzKN6Gt9yBcP1PG6pQnfyUuqR5bpbI=', '<p><strong style="color: #252525; font-family: sans-serif; font-size: 13px; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: 19.1875px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; background-color: #ffffff;">Active Server Pages</strong><span style="color: #252525; font-family: sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 19.1875px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; background-color: #ffffff; display: inline !important; float: none;"><span class="Apple-converted-space">&nbsp;</span>(</span><strong style="color: #252525; font-family: sans-serif; font-size: 13px; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: 19.1875px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; background-color: #ffffff;">ASP</strong><span style="color: #252525; font-family: sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 19.1875px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; background-color: #ffffff; display: inline !important; float: none;">),</span><sup id="cite_ref-1" class="reference" style="line-height: 1em; unicode-bidi: -webkit-isolate; font-weight: normal; font-style: normal; color: #252525; font-family: sans-serif; font-variant: normal; letter-spacing: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; background-color: #ffffff;"><a style="text-decoration: none; color: #0b0080; background-image: none; white-space: nowrap; background-position: initial initial; background-repeat: initial initial;" href="http://es.wikipedia.org/wiki/Active_Server_Pages#cite_note-1">1</a></sup><span style="color: #252525; font-family: sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 19.1875px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; background-color: #ffffff; display: inline !important; float: none;"><span class="Apple-converted-space">&nbsp;</span>tambi&eacute;n conocido como<span class="Apple-converted-space">&nbsp;</span></span><strong style="color: #252525; font-family: sans-serif; font-size: 13px; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: 19.1875px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; background-color: #ffffff;">ASP cl&aacute;sico</strong><span style="color: #252525; font-family: sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 19.1875px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; background-color: #ffffff; display: inline !important; float: none;">, es una tecnolog&iacute;a de<span class="Apple-converted-space">&nbsp;</span></span><a style="text-decoration: none; color: #0b0080; background-image: none; background-color: #ffffff; font-family: sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 19.1875px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; background-position: initial initial; background-repeat: initial initial;" title="Microsoft" href="http://es.wikipedia.org/wiki/Microsoft">Microsoft</a><span style="color: #252525; font-family: sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 19.1875px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; background-color: #ffffff; display: inline !important; float: none;"><span class="Apple-converted-space">&nbsp;</span>del tipo "lado del servidor" para<span class="Apple-converted-space">&nbsp;</span></span><a style="text-decoration: none; color: #0b0080; background-image: none; background-color: #ffffff; font-family: sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 19.1875px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; background-position: initial initial; background-repeat: initial initial;" title="P&aacute;gina web" href="http://es.wikipedia.org/wiki/P%C3%A1gina_web">p&aacute;ginas web</a><span style="color: #252525; font-family: sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 19.1875px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; background-color: #ffffff; display: inline !important; float: none;"><span class="Apple-converted-space">&nbsp;</span>generadas<span class="Apple-converted-space">&nbsp;</span></span><a style="text-decoration: none; color: #0b0080; background-image: none; background-color: #ffffff; font-family: sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 19.1875px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; background-position: initial initial; background-repeat: initial initial;" title="Din&aacute;mica" href="http://es.wikipedia.org/wiki/Din%C3%A1mica">din&aacute;micamente</a><span style="color: #252525; font-family: sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 19.1875px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; background-color: #ffffff; display: inline !important; float: none;">, que ha sido comercializada como un anexo a<span class="Apple-converted-space">&nbsp;</span></span><a style="text-decoration: none; color: #0b0080; background-image: none; background-color: #ffffff; font-family: sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 19.1875px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; background-position: initial initial; background-repeat: initial initial;" title="Internet Information Services" href="http://es.wikipedia.org/wiki/Internet_Information_Services">Internet Information Services</a><span style="color: #252525; font-family: sans-serif; font-size: 13px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: 19.1875px; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; background-color: #ffffff; display: inline !important; float: none;"><span class="Apple-converted-space">&nbsp;</span>(IIS).</span></p>', 'QUE ES ASP', 'NULL', '2013-10-25'),
('K39sx2dyg/J5iSHhmJX50CNL4CegsHhxwMo4/Py0v6w=', 'x8tmV7V2SQgPU+gseFB15Gijfg6DDgxbR2iKpI9qZdw=', '<p>&lt;!DOCTYPE html&gt;<br />&lt;html&gt;<br /> &lt;body&gt;<br /> <br /> &lt;h1&gt;My First Web Page&lt;/h1&gt;<br /> <br /> <span class="marked">&lt;script&gt;<br /> document.write("&lt;p&gt;My First JavaScript&lt;/p&gt;");<br /> &lt;/script&gt;</span><br /> <br /> &lt;/body&gt;<br /> &lt;/html&gt;</p>', 'Continuacion ...', 'NULL', '2013-11-01'),
('lQlY/W5zmjEECFwuzVLNuZnBug/XzSSYsk69JkWrEjU=', 'dJxLDhHg8JeMjev2O9Hz4i/mEU2s2Jr0YP2nJNRgUig=', '<p><a href="http://mypizarron.com/index_web.php"><img style="display: block; margin-left: auto; margin-right: auto;" src="http://mypizarron.com/diseno/logo1.png" alt="" width="219" height="58" /></a></p>\r\n<p>&nbsp;</p>\r\n<h3 style="text-align: center;">MY PIZARRON PLATAFORMA VIRTUAL MUY PODEROSA</h3>\r\n<h3 style="text-align: center;"></h3>', 'My pizarron Potente plataforma', 'NULL', '2013-11-01'),
('M4h73DM0NK9hmdrJH+2I62IsvfXB2KyHZWy3OkAmOBs=', 'dJxLDhHg8JeMjev2O9Hz4i/mEU2s2Jr0YP2nJNRgUig=', '<p style="text-align: center;">&nbsp;</p>\r\n<p style="text-align: center;"><span class="CodeDownloadText"><a href="http://msdn.microsoft.com/es-es/magazine/cc337884.aspx#S1">Patr&oacute;n Controlador de vista de modelo</a> <br /> <a href="http://msdn.microsoft.com/es-es/magazine/cc337884.aspx#S2">Creaci&oacute;n de un controlador</a> <br /> <a href="http://msdn.microsoft.com/es-es/magazine/cc337884.aspx#S3">Creaci&oacute;n de una vista</a> <br /> <a href="http://msdn.microsoft.com/es-es/magazine/cc337884.aspx#S4">Un ejemplo mejor</a> <br /> <a href="http://msdn.microsoft.com/es-es/magazine/cc337884.aspx#S5">Creaci&oacute;n de formularios y devoluci&oacute;n</a> <br /> <a href="http://msdn.microsoft.com/es-es/magazine/cc337884.aspx#S6">Creaci&oacute;n del controlador</a> <br /> <a href="http://msdn.microsoft.com/es-es/magazine/cc337884.aspx#S7">Otros puntos de extensibilidad</a> <br /> <a href="http://msdn.microsoft.com/es-es/magazine/cc337884.aspx#S8">&iquest;Adi&oacute;s a los formularios Web Forms?</a> </span></p>', 'CONTINUACION MVC', 'NULL', '0000-00-00'),
('Qia3N7ZOuL3I8l5YdHcKX5q1IQ10ZBosbegK882IZu0=', 'dXTgJaAfia4FZCVPSU0rXG0J0RUz5TimqJfwAM/MAlc=', '<p><img style="display: block; margin-left: auto; margin-right: auto;" src="http://farm6.static.flickr.com/5505/10330357344_accd88b546.jpg" alt="" width="354" height="221" /></p>', 'Introduccion a visual studio 2013', 'NULL', '0000-00-00'),
('rMZ00JoYFcAzMDuJgQv2h93M9NgapkFPdx06c1fWDz4=', 'Mu9yI0H7RpK72f9QDvaxgbR7HhzEWTed/RbNEsfs6MY=', '<p>\r\n<object width="425" height="350" data="http://www.youtube.com/v/NewzGlCCQ4w" type="application/x-shockwave-flash">\r\n<param name="src" value="http://www.youtube.com/v/NewzGlCCQ4w" />\r\n</object>\r\n</p>', 'introduccion a PHP', 'NULL', '2013-10-31'),
('S04WLF/TRnBKzyvWrXJme0q4y5BbKac6oIg7L+VzFCs=', 'dJxLDhHg8JeMjev2O9Hz4i/mEU2s2Jr0YP2nJNRgUig=', '<p>\r\n<object width="425" height="350" data="http://www.youtube.com/v/nTOAXkMbd_0" type="application/x-shockwave-flash">\r\n<param name="src" value="http://www.youtube.com/v/nTOAXkMbd_0" />\r\n</object>\r\n</p>\r\n<p>&nbsp;</p>', 'Video tutoria maquetacion y diseño ASP', 'NULL', '2013-11-01'),
('tpnXqcwrijD9nm0mnyFc8sKZvSmisENeEdlu/6T6gUk=', 'dJxLDhHg8JeMjev2O9Hz4i/mEU2s2Jr0YP2nJNRgUig=', '<p><a href="http://www.udb.edu.sv/udb/archivo/guia/informatica-ingenieria/asp/2013/ii/guia-1.pdf"><img style="display: block; margin-left: auto; margin-right: auto;" src="http://us.123rf.com/400wm/400/400/arcady31/arcady311209/arcady31120900065/15399621-pdf-file-download-icon-vector-illustration.jpg" alt="" width="100" height="100" /></a></p>\r\n<p style="text-align: center;">&nbsp;</p>\r\n<p style="text-align: center;">Descarga la guia</p>', 'GUIA PDF ASP.NET', 'NULL', '2013-11-01'),
('ZBtwbH7joEVxhz1ItNsNjPvQPR5UCC37JPngQV3kp6Y=', 'dJxLDhHg8JeMjev2O9Hz4i/mEU2s2Jr0YP2nJNRgUig=', '<div class="FeatureHeadline">Creaci&oacute;n de aplicaciones web sin formularios Web Forms</div>\r\n<div class="FeatureByLine">Chris Tavares</div>\r\n<p>&nbsp;</p>\r\n<div class="clsBeta">Este  art&iacute;culo se basa en una versi&oacute;n preliminar de ASP.NET MVC Framework. Los  detalles de este documento est&aacute;n sujetos a cambios.</div>\r\n<table>\r\n<tbody>\r\n<tr valign="top">\r\n<td><span class="CodeDownloadText">En este art&iacute;culo se analizan los siguientes temas: </span> \r\n<ul>\r\n<li class="ListingBullet">Patr&oacute;n Controlador de vista de modelo (MVC, Model View Controller) </li>\r\n<li class="ListingBullet">Creaci&oacute;n de controladores y vistas </li>\r\n<li class="ListingBullet">Creaci&oacute;n de formularios y devoluci&oacute;n </li>\r\n<li class="ListingBullet">F&aacute;bricas de controladores y otros puntos de extensibilidad </li>\r\n</ul>\r\n</td>\r\n<td><span class="CodeDownloadText">En este art&iacute;culo se utilizan las siguientes tecnolog&iacute;as: </span> <br />ASP.NET<br /></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><span class="CodeDownloadText">Descarga de c&oacute;digo disponible en: </span> <a href="http://download.microsoft.com/download/f/2/7/f279e71e-efb0-4155-873d-5554a0608523/MVCFramework2008_03.exe">MVCFramework2008_03.exe</a> <span class="CodeDownloadText"> (189 KB) </span> <br /> <span> <a id="ctl00_MTContentSelector1_mainContentContainer_ctl01" href="http://msdn.microsoft.com/es-es/magazine/cc337976.aspx">Browse the Code Online</a></span></p>\r\n<p>&nbsp;</p>\r\n<p><span><br /></span></p>', 'Asp y MVC', 'NULL', '0000-00-00'),
('zohUG721PgmO/J3FhZ7HIfpvwvB/DF4UKTSikbMiO3c=', 'AKDgl30h25iCTzKN6Gt9yBcP1PG6pQnfyUuqR5bpbI=', '<p>Aca les comparto My pizarron otra plataforma estudiante en desarrollo</p>\r\n<p><a href="http://mypizarron.com/index_web.php"><img style="display: block; margin-left: auto; margin-right: auto;" src="http://mypizarron.com/diseno/logo1.png" alt="" width="219" height="58" /></a></p>', 'Una plataforma estudiantil', 'NULL', '2013-10-25');

-- --------------------------------------------------------

--
-- Table structure for table `estudiante_curso`
--

CREATE TABLE IF NOT EXISTS `estudiante_curso` (
  `id_estudiante` varchar(255) NOT NULL,
  `id_curso` varchar(255) NOT NULL,
  `id_user` text NOT NULL,
  PRIMARY KEY (`id_estudiante`),
  FULLTEXT KEY `id_curso` (`id_curso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `estudiante_curso`
--

INSERT INTO `estudiante_curso` (`id_estudiante`, `id_curso`, `id_user`) VALUES
('@est12134921', 'calc888', '0UYc8Xk62+w4kEHO0Amzb4TXyDUCzMNHkGekPNbg75k='),
('@est12437024', 'mate666', '0UYc8Xk62+w4kEHO0Amzb4TXyDUCzMNHkGekPNbg75k='),
('@est14350643', 'curso_asp_500', 'VbbGw5sgR6yinvZ1lAgrxzhrxzUuJRjLjb4G17rx9jg='),
('@est14652446', 'mate666', 'VbbGw5sgR6yinvZ1lAgrxzhrxzUuJRjLjb4G17rx9jg='),
('@est14753247', 'fisica400', 'QfNmXIg+KDIhxILQazJMzmEBRIoB6kNL94mWeHcQRI0='),
('@est16240534', 'curso_asp_500', '0UYc8Xk62+w4kEHO0Amzb4TXyDUCzMNHkGekPNbg75k='),
('@est17069269', 'php3841', '6M5Z2SjMEZMhnQOg0wcdpP/AAh++/9bvEvGUz3G3RJk='),
('@est17774477', 'fisica400', 'VbbGw5sgR6yinvZ1lAgrxzhrxzUuJRjLjb4G17rx9jg='),
('@estPublic1042285', 'java444', '0UYc8Xk62+w4kEHO0Amzb4TXyDUCzMNHkGekPNbg75k='),
('@estPublic11027511', 'cpp 777', '0UYc8Xk62+w4kEHO0Amzb4TXyDUCzMNHkGekPNbg75k='),
('@estPublic11530615', 'java444', 'Rc5LluKVZCFVIkezkcCBOSKXbs8Pym1waN6tN4HiaSY='),
('@estPublic13343634', 'java444', '6M5Z2SjMEZMhnQOg0wcdpP/AAh++/9bvEvGUz3G3RJk='),
('@estPublic14689297', 'c++ 222', 'w+q8PVJ6CPbhdR2khjyMV5Xs4VWyydi4BeNTCZzT3/U='),
('@estPublic15055450', 'java444', 'VbbGw5sgR6yinvZ1lAgrxzhrxzUuJRjLjb4G17rx9jg='),
('@estPublic15357753', 'c++ 222', '0UYc8Xk62+w4kEHO0Amzb4TXyDUCzMNHkGekPNbg75k='),
('@estPublic16767567', 'cpp 777', 'VbbGw5sgR6yinvZ1lAgrxzhrxzUuJRjLjb4G17rx9jg='),
('@estPublic17673575', 'cpp 777', 'Rc5LluKVZCFVIkezkcCBOSKXbs8Pym1waN6tN4HiaSY='),
('@estPublic17875178', 'cpp 777', 'pumVwazCGFwB9KytZkhzpcgc2S1p1T7Oy5lVR0soR3o='),
('@estPublic19284791', 'c++ 222', 'pumVwazCGFwB9KytZkhzpcgc2S1p1T7Oy5lVR0soR3o='),
('@estPublic19687695', 'java444', 'QfNmXIg+KDIhxILQazJMzmEBRIoB6kNL94mWeHcQRI0=');

-- --------------------------------------------------------

--
-- Table structure for table `foros_curso`
--

CREATE TABLE IF NOT EXISTS `foros_curso` (
  `id_foro` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` varchar(255) NOT NULL,
  `id_periodo` varchar(255) DEFAULT NULL,
  `comentario` text,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_foro`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `foros_curso`
--

INSERT INTO `foros_curso` (`id_foro`, `id_user`, `id_periodo`, `comentario`, `fecha`) VALUES
(1, 'pumVwazCGFwB9KytZkhzpcgc2S1p1T7Oy5lVR0soR3o=', 'dJxLDhHg8JeMjev2O9Hz4i/mEU2s2Jr0YP2nJNRgUig=', 'HOLA ALUMNOS BIENVENIDOS AL PERIODO 2 DE ESTE CURSO', '2013-10-07'),
(2, 'pumVwazCGFwB9KytZkhzpcgc2S1p1T7Oy5lVR0soR3o=', 'dJxLDhHg8JeMjev2O9Hz4i/mEU2s2Jr0YP2nJNRgUig=', 'este curso sera muy bueno', '2013-10-06'),
(3, 'pumVwazCGFwB9KytZkhzpcgc2S1p1T7Oy5lVR0soR3o=', 'dJxLDhHg8JeMjev2O9Hz4i/mEU2s2Jr0YP2nJNRgUig=', 'COMENTARIo', '2013-10-26'),
(4, 'pumVwazCGFwB9KytZkhzpcgc2S1p1T7Oy5lVR0soR3o=', 'dJxLDhHg8JeMjev2O9Hz4i/mEU2s2Jr0YP2nJNRgUig=', 'hola mortales', '2013-10-26'),
(5, 'pumVwazCGFwB9KytZkhzpcgc2S1p1T7Oy5lVR0soR3o=', 'vcVaijpsX4sf9cQCUKS/Zp/2cs0YbKMXqxZgDRm2GaBWXcf9kDzjaPqequs7ASP1', 'Modulo de javascript esta abierto para todo publico , saludos les brinda su tutor', '2013-10-26'),
(6, 'VbbGw5sgR6yinvZ1lAgrxzhrxzUuJRjLjb4G17rx9jg=', 'vcVaijpsX4sf9cQCUKS/Zp/2cs0YbKMXqxZgDRm2GaBWXcf9kDzjaPqequs7ASP1', 'hola profe que tal como esta ?', '2013-10-26'),
(7, 'VbbGw5sgR6yinvZ1lAgrxzhrxzUuJRjLjb4G17rx9jg=', 'vcVaijpsX4sf9cQCUKS/Zp/2cs0YbKMXqxZgDRm2GaBWXcf9kDzjaPqequs7ASP1', 'Espero que este nodulo nos enseñe mucho sobre el framework javascript', '2013-10-26'),
(8, 'pumVwazCGFwB9KytZkhzpcgc2S1p1T7Oy5lVR0soR3o=', 'vcVaijpsX4sf9cQCUKS/Zp/2cs0YbKMXqxZgDRm2GaBWXcf9kDzjaPqequs7ASP1', 'Si este modulo aprenderemos a usar javascript desde cero , para mientras aca les dejo un libro de introduccion de javascript', '2013-10-26'),
(9, 'pumVwazCGFwB9KytZkhzpcgc2S1p1T7Oy5lVR0soR3o=', 'Wq0JTVQ8EVIcVYoupdPc0+UxUiLPLuaqbLewwE+utqM=', 'Comenzaremos a dejar material sobre integrales dobles espero que sea de su agrado', '2013-10-26'),
(10, 'VbbGw5sgR6yinvZ1lAgrxzhrxzUuJRjLjb4G17rx9jg=', 'Wq0JTVQ8EVIcVYoupdPc0+UxUiLPLuaqbLewwE+utqM=', 'muchas gracias ', '2013-10-26'),
(11, 'VbbGw5sgR6yinvZ1lAgrxzhrxzUuJRjLjb4G17rx9jg=', '5suPhNCuR5pLRovCPc2DRjS753KxEcd8+f7K5etzuIY=', 'no ha subido materia para este', '2013-10-26'),
(12, 'pumVwazCGFwB9KytZkhzpcgc2S1p1T7Oy5lVR0soR3o=', '5suPhNCuR5pLRovCPc2DRjS753KxEcd8+f7K5etzuIY=', 'ahorita mismo habilitare el periodo para que vean el material', '2013-10-26'),
(13, 'QfNmXIg+KDIhxILQazJMzmEBRIoB6kNL94mWeHcQRI0=', 'dJxLDhHg8JeMjev2O9Hz4i/mEU2s2Jr0YP2nJNRgUig=', 'hola', '2013-10-26'),
(15, 'QfNmXIg+KDIhxILQazJMzmEBRIoB6kNL94mWeHcQRI0=', 'y7cC1v93VTEChY7TyKA/+N4rxEPKBoIA3JPNG1aNT30=', 'periodo 1', '2013-10-26'),
(16, '0UYc8Xk62+w4kEHO0Amzb4TXyDUCzMNHkGekPNbg75k=', 'dJxLDhHg8JeMjev2O9Hz4i/mEU2s2Jr0YP2nJNRgUig=', 'este curso es muy bueno muchas gracias', '2013-10-26'),
(17, '0UYc8Xk62+w4kEHO0Amzb4TXyDUCzMNHkGekPNbg75k=', 'WY3tPCZgK+1PEw8tjhj6l3R6/i0EaDO0J/Ly0085+H0=', 'hola mundo', '2013-10-26'),
(18, '0UYc8Xk62+w4kEHO0Amzb4TXyDUCzMNHkGekPNbg75k=', 'vcVaijpsX4sf9cQCUKS/Zp/2cs0YbKMXqxZgDRm2GaBWXcf9kDzjaPqequs7ASP1', 'correcto muy bien', '2013-10-26'),
(19, '0UYc8Xk62+w4kEHO0Amzb4TXyDUCzMNHkGekPNbg75k=', 'Wq0JTVQ8EVIcVYoupdPc0+UxUiLPLuaqbLewwE+utqM=', 'profesor no entiendo esa correlacion sobre integrales y su region ', '2013-10-26'),
(20, 'VbbGw5sgR6yinvZ1lAgrxzhrxzUuJRjLjb4G17rx9jg=', 'dJxLDhHg8JeMjev2O9Hz4i/mEU2s2Jr0YP2nJNRgUig=', 'hola soy nuevo en este curso que tal ', '2013-10-26'),
(21, 'pumVwazCGFwB9KytZkhzpcgc2S1p1T7Oy5lVR0soR3o=', 'dXTgJaAfia4FZCVPSU0rXG0J0RUz5TimqJfwAM/MAlc=', 'Hola amigos ya esta activo elp periodo 3 ', '2013-10-28'),
(22, 'VbbGw5sgR6yinvZ1lAgrxzhrxzUuJRjLjb4G17rx9jg=', '5suPhNCuR5pLRovCPc2DRjS753KxEcd8+f7K5etzuIY=', 'periodo habilitado gracias !!!', '2013-10-30'),
(23, 'QfNmXIg+KDIhxILQazJMzmEBRIoB6kNL94mWeHcQRI0=', '5suPhNCuR5pLRovCPc2DRjS753KxEcd8+f7K5etzuIY=', 'Hola exelente articulo sobre campos electricos .. saludos', '2013-10-30'),
(24, 'pumVwazCGFwB9KytZkhzpcgc2S1p1T7Oy5lVR0soR3o=', 'oC7XZIo9ribDZTq08jIOtc7/5DZYUpBJfzvFxi6iW8M=', 'aprendiendo c++', '2013-11-01'),
(25, '0UYc8Xk62+w4kEHO0Amzb4TXyDUCzMNHkGekPNbg75k=', 'vcVaijpsX4sf9cQCUKS/Zp/2cs0YbKMXqxZgDRm2GaBWXcf9kDzjaPqequs7ASP1', 'ese pdf de javascri esta muy explicativo gracias por subir este material', '2013-11-01'),
(26, '0UYc8Xk62+w4kEHO0Amzb4TXyDUCzMNHkGekPNbg75k=', 'x8tmV7V2SQgPU+gseFB15Gijfg6DDgxbR2iKpI9qZdw=', 'esperando al periodo 1 , lo veo habilitado pero sin datos', '2013-11-01');

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE IF NOT EXISTS `log` (
  `id_log` varchar(255) NOT NULL,
  `id_user` varchar(255) NOT NULL,
  `user` text NOT NULL,
  `password` text NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id_log`),
  UNIQUE KEY `id_log` (`id_log`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`id_log`, `id_user`, `user`, `password`, `estado`) VALUES
('CVSJ2d/tHD3K50dCYo0+s1k16LEEAJLK4Mz5gvvXuwA=', 'i4z80scbT4BUL9oKHLJ9S/6UTdxr1ltlDGJfXFNeoSs=', 'mario.duran', 'mario', 1),
('Kw/TVyz+ChjxRmnhBJIRfJmxQVZ6zEXls4iNwbuvTfI=', '0UYc8Xk62+w4kEHO0Amzb4TXyDUCzMNHkGekPNbg75k=', 'calin92', 'carlos92', 1),
('qKRY3AZbXVFWf91uSfDmv60sEk7Dl0xf8/bMBmvxA4M=', 'w+q8PVJ6CPbhdR2khjyMV5Xs4VWyydi4BeNTCZzT3/U=', 'emili2', 'linux', 1),
('Uz9EI0EFURQ9P0qX2s/KmGJoLQal6bELJ23nlBEgZM0=', '6M5Z2SjMEZMhnQOg0wcdpP/AAh++/9bvEvGUz3G3RJk=', 'mario90', 'linux', 1),
('WBMFT1k6lqdxaccdgnoaeh4L/UgDxIBX6c4lRLKFaCo=', 'Rc5LluKVZCFVIkezkcCBOSKXbs8Pym1waN6tN4HiaSY=', 'albert', 'linux', 1),
('WG1qopTZ+jPhF8u3ySrJSfjqNJRvr7e+l3OkiAbf9Xg=', 'pumVwazCGFwB9KytZkhzpcgc2S1p1T7Oy5lVR0soR3o=', 'rolignu', 'linux', 1),
('WvOn7xv87Kmx8AHmhFD4wv3uYszbK6jEfEMXxbrNuUI=', 'VbbGw5sgR6yinvZ1lAgrxzhrxzUuJRjLjb4G17rx9jg=', 'jaulito', 'linux', 1),
('zY8qk9QVQNdfLvLH7qoQNl4qKE1JjqZa4S7obKblEKQ=', 'QfNmXIg+KDIhxILQazJMzmEBRIoB6kNL94mWeHcQRI0=', 'petersito', 'peter', 1);

-- --------------------------------------------------------

--
-- Table structure for table `log_`
--

CREATE TABLE IF NOT EXISTS `log_` (
  `id_log_` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` varchar(255) DEFAULT NULL,
  `error` text NOT NULL,
  `sector` text NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_log_`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=82 ;

--
-- Dumping data for table `log_`
--

INSERT INTO `log_` (`id_log_`, `id_user`, `error`, `sector`, `fecha`) VALUES
(1, 'NULL', 'prueba de log', 'Login inicio de sesion', '2013-09-19'),
(2, 'NULL', 'El buzón de correo no está disponible. La respuesta del servidor fue: 5.7.3 Requested action aborted; user not authenticated', 'Recuperar contraseña', '2013-09-28'),
(3, 'NULL', 'El buzón de correo no está disponible. La respuesta del servidor fue: 5.7.3 Requested action aborted; user not authenticated', 'Recuperar contraseña', '2013-09-28'),
(4, 'NULL', 'Error sesion', 'curso', '2013-10-05'),
(5, 'NULL', 'La cadena especificada no tiene la forma obligatoria para una dirección de correo electrónico.', 'Recuperar contraseña', '2013-10-10'),
(6, 'NULL', 'Referencia a objeto no establecida como instancia de un objeto.', 'Seguridad correo verificar', '2013-10-12'),
(7, 'pumVwazCGFwB9KytZkhzpcgc2S1p1T7Oy5lVR0soR3o=', 'Índice fuera de los límites de la matriz.', 'editar perfil', '2013-10-14'),
(8, 'NULL', 'No hay ninguna fila en la posición 0.', 'clase tutor ... get_periodo', '2013-10-17'),
(9, 'NULL', 'No hay ninguna fila en la posición 0.', 'clase tutor ... get_periodo', '2013-10-17'),
(10, 'NULL', 'No hay ninguna fila en la posición 0.', 'clase tutor ... get_periodo', '2013-10-17'),
(11, 'NULL', 'No hay ninguna fila en la posición 0.', 'clase tutor ... get_periodo', '2013-10-17'),
(12, '0UYc8Xk62+w4kEHO0Amzb4TXyDUCzMNHkGekPNbg75k=', 'Esta fila ya pertenece a otra tabla.', 'buscar cursos ', '2013-10-17'),
(13, '0UYc8Xk62+w4kEHO0Amzb4TXyDUCzMNHkGekPNbg75k=', 'No hay ninguna fila en la posición 0.', 'buscar cursos ', '2013-10-17'),
(14, '0UYc8Xk62+w4kEHO0Amzb4TXyDUCzMNHkGekPNbg75k=', 'No hay ninguna fila en la posición 0.', 'buscar cursos ', '2013-10-17'),
(15, '0UYc8Xk62+w4kEHO0Amzb4TXyDUCzMNHkGekPNbg75k=', 'No hay ninguna fila en la posición 1.', 'buscar cursos ', '2013-10-17'),
(16, '0UYc8Xk62+w4kEHO0Amzb4TXyDUCzMNHkGekPNbg75k=', 'La matriz de entrada es más larga que el número de columnas en esta tabla.', 'buscar cursos ', '2013-10-17'),
(17, '0UYc8Xk62+w4kEHO0Amzb4TXyDUCzMNHkGekPNbg75k=', 'El tipo de valor no coincide con el tipo de columnaNo se puede almacenar <ASP.NET> en la columna Column1. El tipo esperado es ImageField.', 'buscar cursos ', '2013-10-17'),
(18, '0UYc8Xk62+w4kEHO0Amzb4TXyDUCzMNHkGekPNbg75k=', 'El tipo de valor no coincide con el tipo de columnaNo se puede almacenar </images/cursos/curso1.jpg> en la columna Column1. El tipo esperado es ImageField.', 'buscar cursos ', '2013-10-17'),
(19, '0UYc8Xk62+w4kEHO0Amzb4TXyDUCzMNHkGekPNbg75k=', 'El tipo de valor no coincide con el tipo de columnaNo se puede almacenar <ASP.NET> en la columna Nombre Curso. El tipo esperado es BoundField.', 'buscar cursos ', '2013-10-17'),
(20, '0UYc8Xk62+w4kEHO0Amzb4TXyDUCzMNHkGekPNbg75k=', 'El tipo de valor no coincide con el tipo de columnaNo se puede almacenar <curso1.jpg> en la columna Column1. El tipo esperado es ImageField.', 'buscar cursos ', '2013-10-17'),
(21, '0UYc8Xk62+w4kEHO0Amzb4TXyDUCzMNHkGekPNbg75k=', 'El tipo de valor no coincide con el tipo de columnaNo se puede almacenar <curso1.jpg> en la columna Column1. El tipo esperado es ImageField.', 'buscar cursos ', '2013-10-17'),
(22, '0UYc8Xk62+w4kEHO0Amzb4TXyDUCzMNHkGekPNbg75k=', 'El tipo de valor no coincide con el tipo de columnaNo se puede almacenar <ASP.NET> en la columna Nombre Curso. El tipo esperado es BoundField.', 'buscar cursos ', '2013-10-17'),
(23, '0UYc8Xk62+w4kEHO0Amzb4TXyDUCzMNHkGekPNbg75k=', 'El tipo de valor no coincide con el tipo de columnaNo se puede almacenar <periodo__> en la columna REGISTRARSE. El tipo esperado es HyperLinkField.', 'buscar cursos ', '2013-10-17'),
(24, '0UYc8Xk62+w4kEHO0Amzb4TXyDUCzMNHkGekPNbg75k=', 'El tipo de valor no coincide con el tipo de columnaNo se puede almacenar <periodo__> en la columna REGISTRARSE. El tipo esperado es HyperLinkField.', 'buscar cursos ', '2013-10-17'),
(25, '0UYc8Xk62+w4kEHO0Amzb4TXyDUCzMNHkGekPNbg75k=', 'No se puede encontrar la columna 6.', 'buscar cursos ', '2013-10-17'),
(26, '0UYc8Xk62+w4kEHO0Amzb4TXyDUCzMNHkGekPNbg75k=', 'No se puede encontrar la columna 6.', 'buscar cursos ', '2013-10-17'),
(27, '0UYc8Xk62+w4kEHO0Amzb4TXyDUCzMNHkGekPNbg75k=', 'No se puede encontrar la columna 6.', 'buscar cursos ', '2013-10-17'),
(28, '0UYc8Xk62+w4kEHO0Amzb4TXyDUCzMNHkGekPNbg75k=', 'No se puede encontrar la columna 6.', 'buscar cursos ', '2013-10-17'),
(29, '0UYc8Xk62+w4kEHO0Amzb4TXyDUCzMNHkGekPNbg75k=', 'No se puede encontrar la columna 6.', 'buscar cursos ', '2013-10-17'),
(30, '0UYc8Xk62+w4kEHO0Amzb4TXyDUCzMNHkGekPNbg75k=', 'No se puede encontrar la columna 6.', 'buscar cursos ', '2013-10-17'),
(31, '0UYc8Xk62+w4kEHO0Amzb4TXyDUCzMNHkGekPNbg75k=', 'El tipo de valor no coincide con el tipo de columnaNo se puede almacenar <ImageField> en la columna ABIERTO/CERRADO. El tipo esperado es Image.', 'buscar cursos ', '2013-10-17'),
(32, '0UYc8Xk62+w4kEHO0Amzb4TXyDUCzMNHkGekPNbg75k=', 'El tipo de valor no coincide con el tipo de columnaNo se puede almacenar <ImageField> en la columna ABIERTO/CERRADO. El tipo esperado es Image.', 'buscar cursos ', '2013-10-17'),
(33, 'NULL', 'No hay ninguna fila en la posición 0.', 'clase tutor ... get_periodo', '2013-10-18'),
(34, 'NULL', 'Error sesion', 'curso', '2013-10-18'),
(35, 'pumVwazCGFwB9KytZkhzpcgc2S1p1T7Oy5lVR0soR3o=', 'Referencia a objeto no establecida como instancia de un objeto.', 'INDEX.ASPX', '2013-10-21'),
(36, 'pumVwazCGFwB9KytZkhzpcgc2S1p1T7Oy5lVR0soR3o=', 'La cadena de entrada no tiene el formato correcto.', 'buscar cursos ', '2013-10-22'),
(37, 'NULL', 'No hay ninguna fila en la posición 0.', 'clase tutor ... get_periodo', '2013-10-22'),
(38, '0UYc8Xk62+w4kEHO0Amzb4TXyDUCzMNHkGekPNbg75k=', 'FUNCTION myplumon.CONTCAT does not exist', 'clase tutor', '2013-10-22'),
(39, '0UYc8Xk62+w4kEHO0Amzb4TXyDUCzMNHkGekPNbg75k=', 'FUNCTION myplumon.CONTCAT does not exist', 'clase tutor', '2013-10-22'),
(40, 'NULL', 'No hay ninguna fila en la posición 0.', 'clase tutor ... get_periodo', '2013-10-22'),
(41, 'NULL', 'No hay ninguna fila en la posición 0.', 'clase tutor ... get_periodo', '2013-10-22'),
(42, 'NULL', 'No hay ninguna fila en la posición 0.', 'clase tutor ... get_periodo', '2013-10-22'),
(43, 'QfNmXIg KDIhxILQazJMzmEBRIoB6kNL94mWeHcQRI0=', 'El índice estaba fuera del intervalo. Debe ser un valor no negativo e inferior al tamaño de la colección.\r\nNombre del parámetro: index', 'perfil', '2013-10-22'),
(44, '6M5Z2SjMEZMhnQOg0wcdpP/AAh  /9bvEvGUz3G3RJk=', 'El índice estaba fuera del intervalo. Debe ser un valor no negativo e inferior al tamaño de la colección.\r\nNombre del parámetro: index', 'perfil', '2013-10-22'),
(45, '0UYc8Xk62 w4kEHO0Amzb4TXyDUCzMNHkGekPNbg75k=', 'El índice estaba fuera del intervalo. Debe ser un valor no negativo e inferior al tamaño de la colección.\r\nNombre del parámetro: index', 'perfil', '2013-10-22'),
(46, '0UYc8Xk62 w4kEHO0Amzb4TXyDUCzMNHkGekPNbg75k=', 'El índice estaba fuera del intervalo. Debe ser un valor no negativo e inferior al tamaño de la colección.\r\nNombre del parámetro: index', 'perfil', '2013-10-22'),
(47, '0UYc8Xk62 w4kEHO0Amzb4TXyDUCzMNHkGekPNbg75k=', 'El índice estaba fuera del intervalo. Debe ser un valor no negativo e inferior al tamaño de la colección.\r\nNombre del parámetro: index', 'perfil', '2013-10-22'),
(48, '0UYc8Xk62 w4kEHO0Amzb4TXyDUCzMNHkGekPNbg75k=', 'El índice estaba fuera del intervalo. Debe ser un valor no negativo e inferior al tamaño de la colección.\r\nNombre del parámetro: index', 'perfil', '2013-10-22'),
(49, '0UYc8Xk62 w4kEHO0Amzb4TXyDUCzMNHkGekPNbg75k=', 'El índice estaba fuera del intervalo. Debe ser un valor no negativo e inferior al tamaño de la colección.\r\nNombre del parámetro: index', 'perfil', '2013-10-22'),
(50, 'NULL', 'No hay ninguna fila en la posición 0.', 'clase tutor ... get_periodo', '2013-10-23'),
(51, 'NULL', 'No hay ninguna fila en la posición 0.', 'clase tutor ... get_periodo', '2013-10-23'),
(52, 'NULL', 'No hay ninguna fila en la posición 0.', 'clase tutor ... get_periodo', '2013-10-23'),
(53, 'NULL', 'No hay ninguna fila en la posición 0.', 'clase tutor ... get_periodo', '2013-10-23'),
(54, 'NULL', 'No hay ninguna fila en la posición 0.', 'clase tutor ... get_periodo', '2013-10-23'),
(55, 'NULL', 'No hay ninguna fila en la posición 0.', 'clase tutor ... get_periodo', '2013-10-23'),
(56, 'NULL', 'No hay ninguna fila en la posición 0.', 'clase tutor ... get_periodo', '2013-10-23'),
(57, 'NULL', 'No hay ninguna fila en la posición 0.', 'clase tutor ... get_periodo', '2013-10-23'),
(58, 'NULL', 'No hay ninguna fila en la posición 0.', 'clase tutor ... get_periodo', '2013-10-23'),
(59, 'NULL', 'No hay ninguna fila en la posición 0.', 'clase tutor ... get_periodo', '2013-10-23'),
(60, 'NULL', 'No hay ninguna fila en la posición 0.', 'clase tutor ... get_periodo', '2013-10-24'),
(61, 'NULL', 'Error sesion', 'curso', '2013-10-25'),
(62, 'NULL', 'Error sesion', 'curso', '2013-10-25'),
(63, 'NULL', 'No hay ninguna fila en la posición 0.', 'clase tutor ... get_periodo', '2013-10-25'),
(64, 'NULL', 'No hay ninguna fila en la posición 0.', 'clase tutor ... get_periodo', '2013-10-25'),
(65, 'NULL', 'No hay ninguna fila en la posición 0.', 'clase tutor ... get_periodo', '2013-10-25'),
(66, 'NULL', 'No hay ninguna fila en la posición 0.', 'clase tutor ... get_periodo', '2013-10-25'),
(67, 'NULL', 'No hay ninguna fila en la posición 0.', 'clase tutor ... get_periodo', '2013-10-25'),
(68, 'NULL', 'No hay ninguna fila en la posición 0.', 'clase tutor ... get_periodo', '2013-10-25'),
(69, 'NULL', 'No hay ninguna fila en la posición 0.', 'clase tutor ... get_periodo', '2013-10-25'),
(70, 'NULL', 'No hay ninguna fila en la posición 0.', 'clase tutor ... get_periodo', '2013-10-25'),
(71, 'NULL', 'No hay ninguna fila en la posición 0.', 'clase tutor ... get_periodo', '2013-10-25'),
(72, 'NULL', 'No hay ninguna fila en la posición 0.', 'clase tutor ... get_periodo', '2013-10-25'),
(73, 'NULL', 'No hay ninguna fila en la posición 0.', 'clase tutor ... get_periodo', '2013-10-25'),
(74, 'NULL', 'Error sesion', 'curso', '2013-10-25'),
(75, 'NULL', 'No hay ninguna fila en la posición 0.', 'clase tutor ... get_periodo', '2013-10-25'),
(76, 'NULL', 'Error sesion', 'curso', '2013-10-26'),
(77, 'NULL', 'Error sesion', 'curso', '2013-10-26'),
(78, 'NULL', 'Error sesion', 'curso', '2013-10-26'),
(79, 'NULL', 'La cadena especificada no tiene la forma obligatoria para una dirección de correo electrónico.', 'Recuperar contraseña', '2013-10-31'),
(80, 'NULL', 'Error sesion', 'curso', '2013-11-01'),
(81, 'NULL', 'Error sesion', 'curso', '2013-11-02');

-- --------------------------------------------------------

--
-- Table structure for table `mensajeria`
--

CREATE TABLE IF NOT EXISTS `mensajeria` (
  `id_mensaje` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` varchar(255) DEFAULT NULL,
  `id_usuario_de` varchar(255) NOT NULL,
  `mensaje` text NOT NULL,
  `fecha` date NOT NULL,
  `hora` text NOT NULL,
  `leido` int(1) NOT NULL,
  PRIMARY KEY (`id_mensaje`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='sistema que maneja la mensajeria de los modulos' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `mensajeria`
--

INSERT INTO `mensajeria` (`id_mensaje`, `id_user`, `id_usuario_de`, `mensaje`, `fecha`, `hora`, `leido`) VALUES
(1, 'pumVwazCGFwB9KytZkhzpcgc2S1p1T7Oy5lVR0soR3o=', 'pumVwazCGFwB9KytZkhzpcgc2S1p1T7Oy5lVR0soR3o=', 'hola como estas ', '2013-10-01', '12:50', 0),
(2, 'pumVwazCGFwB9KytZkhzpcgc2S1p1T7Oy5lVR0soR3o=', 'pumVwazCGFwB9KytZkhzpcgc2S1p1T7Oy5lVR0soR3o=', 'HOLA COMO ESTAS MARICA', '2013-10-01', '12:50', 0),
(3, 'pumVwazCGFwB9KytZkhzpcgc2S1p1T7Oy5lVR0soR3o=', 'pumVwazCGFwB9KytZkhzpcgc2S1p1T7Oy5lVR0soR3o=', 'HOLA COMO ESTAS MARICA', '2013-10-01', '12:50', 0);

-- --------------------------------------------------------

--
-- Table structure for table `periodo_curso`
--

CREATE TABLE IF NOT EXISTS `periodo_curso` (
  `id_periodo` varchar(255) NOT NULL,
  `id_curso` varchar(255) NOT NULL,
  `nombre` text NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id_periodo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `periodo_curso`
--

INSERT INTO `periodo_curso` (`id_periodo`, `id_curso`, `nombre`, `estado`) VALUES
('5suPhNCuR5pLRovCPc2DRjS753KxEcd8+f7K5etzuIY=', 'fisica400', 'periodo 1', 1),
('dJxLDhHg8JeMjev2O9Hz4i/mEU2s2Jr0YP2nJNRgUig=', 'curso_asp_500', 'periodo 2', 1),
('dXTgJaAfia4FZCVPSU0rXG0J0RUz5TimqJfwAM/MAlc=', 'curso_asp_500', 'periodo 3 ', 1),
('HnolcqbrY4jmm39MQf3G5LrbReEbWJ8AaUASqdf0y84=', 'mate666', 'vectores R3', 1),
('Mu9yI0H7RpK72f9QDvaxgbR7HhzEWTed/RbNEsfs6MY=', 'php3841', 'php para todos', 1),
('oC7XZIo9ribDZTq08jIOtc7/5DZYUpBJfzvFxi6iW8M=', 'cpp 777', 'que es c++', 1),
('vcVaijpsX4sf9cQCUKS/Zp/2cs0YbKMXqxZgDRm2GaBWXcf9kDzjaPqequs7ASP1', 'java444', 'Introcuccion a javascript', 1),
('Wq0JTVQ8EVIcVYoupdPc0+UxUiLPLuaqbLewwE+utqM=', 'mate666', 'integrales dobles', 1),
('WY3tPCZgK+1PEw8tjhj6l3R6/i0EaDO0J/Ly0085+H0=', 'calc888', 'periodo 1', 1),
('x8tmV7V2SQgPU+gseFB15Gijfg6DDgxbR2iKpI9qZdw=', 'java444', 'periodo 1', 1),
('y7cC1v93VTEChY7TyKA/+N4rxEPKBoIA3JPNG1aNT30=', 'c++ 222', 'periodo 1', 1),
('yIkGkCnoXEGBwTBpzVS5cy1AM3p/LMBiYELxyefPN0w=', 'mate666', 'derivacion parcial', 1);

-- --------------------------------------------------------

--
-- Table structure for table `periodo_documentos`
--

CREATE TABLE IF NOT EXISTS `periodo_documentos` (
  `id_p_documentos` int(11) NOT NULL AUTO_INCREMENT,
  `id_periodo` varchar(255) NOT NULL,
  `titulo` text,
  `notas` text,
  `fecha` date NOT NULL,
  `id_documento` varchar(255) DEFAULT NULL,
  `id_foro` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_p_documentos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `repositorio_curso`
--

CREATE TABLE IF NOT EXISTS `repositorio_curso` (
  `id_repositorio` varchar(255) NOT NULL,
  `id_tarea` varchar(255) NOT NULL,
  `id_estudiante` varchar(255) NOT NULL,
  `archivo` text NOT NULL,
  `estado` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tarea_curso`
--

CREATE TABLE IF NOT EXISTS `tarea_curso` (
  `id_tarea` varchar(255) NOT NULL,
  `id_curso` varchar(255) NOT NULL,
  `id_repositorio` varchar(255) NOT NULL,
  `nombre` text NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_limite` date NOT NULL,
  `asignacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id_user` varchar(255) NOT NULL,
  `nombre` text NOT NULL,
  `apellido` text,
  `alias` text,
  `email` text NOT NULL,
  `nacimiento` date NOT NULL,
  `facebook` text,
  `twitter` text,
  `institucion` varchar(100) NOT NULL,
  `sexo` varchar(20) NOT NULL,
  `pais` text NOT NULL,
  `perfil` int(1) NOT NULL,
  `imagen` text,
  `fecha_inicio` date NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `id_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nombre`, `apellido`, `alias`, `email`, `nacimiento`, `facebook`, `twitter`, `institucion`, `sexo`, `pais`, `perfil`, `imagen`, `fecha_inicio`) VALUES
('0UYc8Xk62+w4kEHO0Amzb4TXyDUCzMNHkGekPNbg75k=', 'carlos', 'ernesto ', 'calin', 'carlos.carlos@gmail.com', '1973-06-18', '', 'rolignu', 'Colegio Don bosco', 'Masculino', 'El salvador', 0, '1532962519_15329625191532962519.jpeg', '2013-10-08'),
('6M5Z2SjMEZMhnQOg0wcdpP/AAh++/9bvEvGUz3G3RJk=', 'mario', 'duran', 'marito', 'mario.duran@gmail.com', '1979-07-07', '', 'Abrastamp ', 'Universidad Don bosco', 'Masculino', 'Honduras', 0, '1771937735_17719377351771937735.jpeg', '2013-10-10'),
('i4z80scbT4BUL9oKHLJ9S/6UTdxr1ltlDGJfXFNeoSs=', 'mario', 'duran', 'alessa', 'mario.duran@gmail.com', '1990-08-19', '', '', 'Universidad Don bosco', 'Masculino', 'El salvador', 0, ' NULL', '2013-09-08'),
('pumVwazCGFwB9KytZkhzpcgc2S1p1T7Oy5lVR0soR3o=', 'Rolando Antonio', 'Arriaza Marroquin', 'Roli', 'rolignu90@gmail.com', '1990-06-18', 'https://www.facebook.com/rolando.a.arriaza', 'chalogandul', 'Universidad Don bosco', 'Masculino', 'El salvador', 1, '1909236732_19092367321909236732.jpg', '2013-09-06'),
('QfNmXIg+KDIhxILQazJMzmEBRIoB6kNL94mWeHcQRI0=', 'Misael ', 'Ramos', 'peter', 'peter.tumadre@hotmail.com', '1993-04-17', '', '', 'Universidad Centroamericana (UCA)', 'Masculino', 'El salvador', 1, '1325980558_13259805581325980558.jpeg', '2013-10-01'),
('Rc5LluKVZCFVIkezkcCBOSKXbs8Pym1waN6tN4HiaSY=', 'alberto', 'arriaza', 'albert', 'alber@gmail.com', '1959-03-18', 'https://www.facebook.com/josemauricio.floresaviles?fref=ts', 'rolignu', 'Universidad De El Salvador', 'Masculino', 'El salvador', 0, '1042392813_10423928131042392813.jpeg', '2013-09-16'),
('VbbGw5sgR6yinvZ1lAgrxzhrxzUuJRjLjb4G17rx9jg=', 'Saul Ovidio', 'Palacios Sisnado', 'jaul', 'saul.palacios@gmail.com', '1993-05-16', 'https://www.facebook.com/saulpalacioscisnado?fref=ts', '', 'Universidad Centroamericana (UCA)', 'Masculino', 'El salvador', 0, '54330581_5433058154330581.jpeg', '2013-10-23'),
('w+q8PVJ6CPbhdR2khjyMV5Xs4VWyydi4BeNTCZzT3/U=', 'emilio', 'iraeta', 'emily', 'emili.com@gmail.com', '1942-04-15', '', '', 'Universidad De El Salvador', 'Masculino', 'El salvador', 0, ' NULL', '2013-11-01');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
