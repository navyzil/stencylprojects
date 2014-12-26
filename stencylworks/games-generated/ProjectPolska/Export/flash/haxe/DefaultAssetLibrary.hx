package;


import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.MovieClip;
import flash.text.Font;
import flash.media.Sound;
import flash.net.URLRequest;
import flash.utils.ByteArray;
import haxe.Unserializer;
import openfl.Assets;

#if (flash || js)
import flash.display.Loader;
import flash.events.Event;
import flash.net.URLLoader;
#end

#if ios
import openfl.utils.SystemPath;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public static var className (default, null) = new Map <String, Dynamic> ();
	public static var path (default, null) = new Map <String, String> ();
	public static var type (default, null) = new Map <String, AssetType> ();
	
	
	public function new () {
		
		super ();
		
		#if flash
		
		className.set ("assets/graphics/1x/sprite-1-0.png", __ASSET__assets_graphics_1x_sprite_1_0_png);
		type.set ("assets/graphics/1x/sprite-1-0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/graphics/1x/sprite-1-1.png", __ASSET__assets_graphics_1x_sprite_1_1_png);
		type.set ("assets/graphics/1x/sprite-1-1.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/graphics/1x/sprite-1-10.png", __ASSET__assets_graphics_1x_sprite_1_10_png);
		type.set ("assets/graphics/1x/sprite-1-10.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/graphics/1x/sprite-1-4.png", __ASSET__assets_graphics_1x_sprite_1_4_png);
		type.set ("assets/graphics/1x/sprite-1-4.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/graphics/1x/sprite-1-6.png", __ASSET__assets_graphics_1x_sprite_1_6_png);
		type.set ("assets/graphics/1x/sprite-1-6.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/graphics/1x/sprite-1-8.png", __ASSET__assets_graphics_1x_sprite_1_8_png);
		type.set ("assets/graphics/1x/sprite-1-8.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/graphics/1x/sprite-16-0.png", __ASSET__assets_graphics_1x_sprite_16_0_png);
		type.set ("assets/graphics/1x/sprite-16-0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/graphics/1x/sprite-16-1.png", __ASSET__assets_graphics_1x_sprite_16_1_png);
		type.set ("assets/graphics/1x/sprite-16-1.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/graphics/1x/sprite-16-2.png", __ASSET__assets_graphics_1x_sprite_16_2_png);
		type.set ("assets/graphics/1x/sprite-16-2.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/graphics/1x/sprite-16-3.png", __ASSET__assets_graphics_1x_sprite_16_3_png);
		type.set ("assets/graphics/1x/sprite-16-3.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/graphics/1x/sprite-26-0.png", __ASSET__assets_graphics_1x_sprite_26_0_png);
		type.set ("assets/graphics/1x/sprite-26-0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/graphics/1x/sprite-28-0.png", __ASSET__assets_graphics_1x_sprite_28_0_png);
		type.set ("assets/graphics/1x/sprite-28-0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/graphics/1x/sprite-28-1.png", __ASSET__assets_graphics_1x_sprite_28_1_png);
		type.set ("assets/graphics/1x/sprite-28-1.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/graphics/1x/sprite-3-0.png", __ASSET__assets_graphics_1x_sprite_3_0_png);
		type.set ("assets/graphics/1x/sprite-3-0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/graphics/1x/sprite-3-1.png", __ASSET__assets_graphics_1x_sprite_3_1_png);
		type.set ("assets/graphics/1x/sprite-3-1.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/graphics/1x/sprite-3-2.png", __ASSET__assets_graphics_1x_sprite_3_2_png);
		type.set ("assets/graphics/1x/sprite-3-2.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/graphics/1x/sprite-3-3.png", __ASSET__assets_graphics_1x_sprite_3_3_png);
		type.set ("assets/graphics/1x/sprite-3-3.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/graphics/1x/sprite-30-0.png", __ASSET__assets_graphics_1x_sprite_30_0_png);
		type.set ("assets/graphics/1x/sprite-30-0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/graphics/1x/sprite-30-1.png", __ASSET__assets_graphics_1x_sprite_30_1_png);
		type.set ("assets/graphics/1x/sprite-30-1.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/graphics/1x/tileset-4.png", __ASSET__assets_graphics_1x_tileset_4_png);
		type.set ("assets/graphics/1x/tileset-4.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/graphics/default-font.fnt", __ASSET__assets_graphics_default_font_fnt);
		type.set ("assets/graphics/default-font.fnt", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/graphics/default-font.png", __ASSET__assets_graphics_default_font_png);
		type.set ("assets/graphics/default-font.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/graphics/preloader-badge.png", __ASSET__assets_graphics_preloader_badge_png);
		type.set ("assets/graphics/preloader-badge.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/graphics/preloader-bg.png", __ASSET__assets_graphics_preloader_bg_png);
		type.set ("assets/graphics/preloader-bg.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/graphics/preloader-bg@1.5x.png", __ASSET__assets_graphics_preloader_bg_1_5x_png);
		type.set ("assets/graphics/preloader-bg@1.5x.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/graphics/preloader-bg@2x.png", __ASSET__assets_graphics_preloader_bg_2x_png);
		type.set ("assets/graphics/preloader-bg@2x.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/graphics/preloader-bg@4x.png", __ASSET__assets_graphics_preloader_bg_4x_png);
		type.set ("assets/graphics/preloader-bg@4x.png", Reflect.field (AssetType, "image".toUpperCase ()));
		className.set ("assets/music/sound-261.mp3", __ASSET__assets_music_sound_261_mp3);
		type.set ("assets/music/sound-261.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		className.set ("assets/sfx/sound-5.mp3", __ASSET__assets_sfx_sound_5_mp3);
		type.set ("assets/sfx/sound-5.mp3", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("assets/sfx/sound-544.mp3", __ASSET__assets_sfx_sound_544_mp3);
		type.set ("assets/sfx/sound-544.mp3", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("assets/sfx/sound-6.mp3", __ASSET__assets_sfx_sound_6_mp3);
		type.set ("assets/sfx/sound-6.mp3", Reflect.field (AssetType, "sound".toUpperCase ()));
		className.set ("assets/data/behaviors.xml", __ASSET__assets_data_behaviors_xml);
		type.set ("assets/data/behaviors.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/data/game.xml", __ASSET__assets_data_game_xml);
		type.set ("assets/data/game.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/data/resources.xml", __ASSET__assets_data_resources_xml);
		type.set ("assets/data/resources.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/data/scene-0.scn", __ASSET__assets_data_scene_0_scn);
		type.set ("assets/data/scene-0.scn", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/data/scene-0.xml", __ASSET__assets_data_scene_0_xml);
		type.set ("assets/data/scene-0.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/data/scene-12.scn", __ASSET__assets_data_scene_12_scn);
		type.set ("assets/data/scene-12.scn", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/data/scene-12.xml", __ASSET__assets_data_scene_12_xml);
		type.set ("assets/data/scene-12.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/data/scene-13.scn", __ASSET__assets_data_scene_13_scn);
		type.set ("assets/data/scene-13.scn", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/data/scene-13.xml", __ASSET__assets_data_scene_13_xml);
		type.set ("assets/data/scene-13.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/data/scene-8.scn", __ASSET__assets_data_scene_8_scn);
		type.set ("assets/data/scene-8.scn", Reflect.field (AssetType, "binary".toUpperCase ()));
		className.set ("assets/data/scene-8.xml", __ASSET__assets_data_scene_8_xml);
		type.set ("assets/data/scene-8.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		className.set ("assets/data/scenes.xml", __ASSET__assets_data_scenes_xml);
		type.set ("assets/data/scenes.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		
		
		#elseif html5
		
		path.set ("assets/graphics/1x/sprite-1-0.png", "assets/graphics/1x/sprite-1-0.png");
		type.set ("assets/graphics/1x/sprite-1-0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/graphics/1x/sprite-1-1.png", "assets/graphics/1x/sprite-1-1.png");
		type.set ("assets/graphics/1x/sprite-1-1.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/graphics/1x/sprite-1-10.png", "assets/graphics/1x/sprite-1-10.png");
		type.set ("assets/graphics/1x/sprite-1-10.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/graphics/1x/sprite-1-4.png", "assets/graphics/1x/sprite-1-4.png");
		type.set ("assets/graphics/1x/sprite-1-4.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/graphics/1x/sprite-1-6.png", "assets/graphics/1x/sprite-1-6.png");
		type.set ("assets/graphics/1x/sprite-1-6.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/graphics/1x/sprite-1-8.png", "assets/graphics/1x/sprite-1-8.png");
		type.set ("assets/graphics/1x/sprite-1-8.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/graphics/1x/sprite-16-0.png", "assets/graphics/1x/sprite-16-0.png");
		type.set ("assets/graphics/1x/sprite-16-0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/graphics/1x/sprite-16-1.png", "assets/graphics/1x/sprite-16-1.png");
		type.set ("assets/graphics/1x/sprite-16-1.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/graphics/1x/sprite-16-2.png", "assets/graphics/1x/sprite-16-2.png");
		type.set ("assets/graphics/1x/sprite-16-2.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/graphics/1x/sprite-16-3.png", "assets/graphics/1x/sprite-16-3.png");
		type.set ("assets/graphics/1x/sprite-16-3.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/graphics/1x/sprite-26-0.png", "assets/graphics/1x/sprite-26-0.png");
		type.set ("assets/graphics/1x/sprite-26-0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/graphics/1x/sprite-28-0.png", "assets/graphics/1x/sprite-28-0.png");
		type.set ("assets/graphics/1x/sprite-28-0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/graphics/1x/sprite-28-1.png", "assets/graphics/1x/sprite-28-1.png");
		type.set ("assets/graphics/1x/sprite-28-1.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/graphics/1x/sprite-3-0.png", "assets/graphics/1x/sprite-3-0.png");
		type.set ("assets/graphics/1x/sprite-3-0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/graphics/1x/sprite-3-1.png", "assets/graphics/1x/sprite-3-1.png");
		type.set ("assets/graphics/1x/sprite-3-1.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/graphics/1x/sprite-3-2.png", "assets/graphics/1x/sprite-3-2.png");
		type.set ("assets/graphics/1x/sprite-3-2.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/graphics/1x/sprite-3-3.png", "assets/graphics/1x/sprite-3-3.png");
		type.set ("assets/graphics/1x/sprite-3-3.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/graphics/1x/sprite-30-0.png", "assets/graphics/1x/sprite-30-0.png");
		type.set ("assets/graphics/1x/sprite-30-0.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/graphics/1x/sprite-30-1.png", "assets/graphics/1x/sprite-30-1.png");
		type.set ("assets/graphics/1x/sprite-30-1.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/graphics/1x/tileset-4.png", "assets/graphics/1x/tileset-4.png");
		type.set ("assets/graphics/1x/tileset-4.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/graphics/default-font.fnt", "assets/graphics/default-font.fnt");
		type.set ("assets/graphics/default-font.fnt", Reflect.field (AssetType, "binary".toUpperCase ()));
		path.set ("assets/graphics/default-font.png", "assets/graphics/default-font.png");
		type.set ("assets/graphics/default-font.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/graphics/preloader-badge.png", "assets/graphics/preloader-badge.png");
		type.set ("assets/graphics/preloader-badge.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/graphics/preloader-bg.png", "assets/graphics/preloader-bg.png");
		type.set ("assets/graphics/preloader-bg.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/graphics/preloader-bg@1.5x.png", "assets/graphics/preloader-bg@1.5x.png");
		type.set ("assets/graphics/preloader-bg@1.5x.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/graphics/preloader-bg@2x.png", "assets/graphics/preloader-bg@2x.png");
		type.set ("assets/graphics/preloader-bg@2x.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/graphics/preloader-bg@4x.png", "assets/graphics/preloader-bg@4x.png");
		type.set ("assets/graphics/preloader-bg@4x.png", Reflect.field (AssetType, "image".toUpperCase ()));
		path.set ("assets/music/sound-261.mp3", "assets/music/sound-261.mp3");
		type.set ("assets/music/sound-261.mp3", Reflect.field (AssetType, "music".toUpperCase ()));
		path.set ("assets/sfx/sound-5.mp3", "assets/sfx/sound-5.mp3");
		type.set ("assets/sfx/sound-5.mp3", Reflect.field (AssetType, "sound".toUpperCase ()));
		path.set ("assets/sfx/sound-544.mp3", "assets/sfx/sound-544.mp3");
		type.set ("assets/sfx/sound-544.mp3", Reflect.field (AssetType, "sound".toUpperCase ()));
		path.set ("assets/sfx/sound-6.mp3", "assets/sfx/sound-6.mp3");
		type.set ("assets/sfx/sound-6.mp3", Reflect.field (AssetType, "sound".toUpperCase ()));
		path.set ("assets/data/behaviors.xml", "assets/data/behaviors.xml");
		type.set ("assets/data/behaviors.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		path.set ("assets/data/game.xml", "assets/data/game.xml");
		type.set ("assets/data/game.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		path.set ("assets/data/resources.xml", "assets/data/resources.xml");
		type.set ("assets/data/resources.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		path.set ("assets/data/scene-0.scn", "assets/data/scene-0.scn");
		type.set ("assets/data/scene-0.scn", Reflect.field (AssetType, "binary".toUpperCase ()));
		path.set ("assets/data/scene-0.xml", "assets/data/scene-0.xml");
		type.set ("assets/data/scene-0.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		path.set ("assets/data/scene-12.scn", "assets/data/scene-12.scn");
		type.set ("assets/data/scene-12.scn", Reflect.field (AssetType, "binary".toUpperCase ()));
		path.set ("assets/data/scene-12.xml", "assets/data/scene-12.xml");
		type.set ("assets/data/scene-12.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		path.set ("assets/data/scene-13.scn", "assets/data/scene-13.scn");
		type.set ("assets/data/scene-13.scn", Reflect.field (AssetType, "binary".toUpperCase ()));
		path.set ("assets/data/scene-13.xml", "assets/data/scene-13.xml");
		type.set ("assets/data/scene-13.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		path.set ("assets/data/scene-8.scn", "assets/data/scene-8.scn");
		type.set ("assets/data/scene-8.scn", Reflect.field (AssetType, "binary".toUpperCase ()));
		path.set ("assets/data/scene-8.xml", "assets/data/scene-8.xml");
		type.set ("assets/data/scene-8.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		path.set ("assets/data/scenes.xml", "assets/data/scenes.xml");
		type.set ("assets/data/scenes.xml", Reflect.field (AssetType, "text".toUpperCase ()));
		
		
		#else
		
		try {
			
			var bytes = ByteArray.readFile ("manifest");
			bytes.position = 0;
			
			if (bytes.length > 0) {
				
				var data = bytes.readUTFBytes (bytes.length);
				
				if (data != null && data.length > 0) {
					
					var manifest:Array<AssetData> = Unserializer.run (data);
					
					for (asset in manifest) {
						
						path.set (asset.id, asset.path);
						type.set (asset.id, asset.type);
						
					}
					
				}
				
			}
			
		} catch (e:Dynamic) {
			
			trace ("Warning: Could not load asset manifest");
			
		}
		
		#end
		
	}
	
	
	public override function exists (id:String, type:AssetType):Bool {
		
		var assetType = DefaultAssetLibrary.type.get (id);
		
		#if pixi
		
		if (assetType == IMAGE) {
			
			return true;
			
		} else {
			
			return false;
			
		}
		
		#end
		
		if (assetType != null) {
			
			if (assetType == type || type == SOUND && (assetType == MUSIC || assetType == SOUND)) {
				
				return true;
				
			}
			
			#if flash
			
			if ((assetType == BINARY || assetType == TEXT) && type == BINARY) {
				
				return true;
				
			} else if (path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (type == BINARY || type == null) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getBitmapData (id:String):BitmapData {
		
		#if pixi
		
		return BitmapData.fromImage (path.get (id));
		
		#elseif flash
		
		return cast (Type.createInstance (className.get (id), []), BitmapData);
		
		#elseif js
		
		return cast (ApplicationMain.loaders.get (path.get (id)).contentLoaderInfo.content, Bitmap).bitmapData;
		
		#else
		
		return BitmapData.load (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if pixi
		
		return null;
		
		#elseif flash
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif js
		
		var bytes:ByteArray = null;
		var data = ApplicationMain.urlLoaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}

		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if pixi
		
		return null;
		
		#elseif (flash || js)
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		return new Font (path.get (id));
		
		#end
		
	}
	
	
	public override function getPath (id:String):String {
		
		#if ios
		
		return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		#else
		
		return path.get (id);
		
		#end
		
	}
	
	
	public override function getSound (id:String):Sound {
		
		#if pixi
		
		return null;
		
		#elseif flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif js
		
		return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return new Sound (new URLRequest (path.get (id)), null, type.get (id) == MUSIC);
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:AssetType):Bool {
		
		#if flash
		
		if (type != AssetType.MUSIC && type != AssetType.SOUND) {
			
			return className.exists (id);
			
		}
		
		#end
		
		return true;
		
	}
	
	
	public override function loadBitmapData (id:String, handler:BitmapData -> Void):Void {
		
		#if pixi
		
		handler (getBitmapData (id));
		
		#elseif (flash || js)
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBitmapData (id));
			
		}
		
		#else
		
		handler (getBitmapData (id));
		
		#end
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		#if pixi
		
		handler (getBytes (id));
		
		#elseif (flash || js)
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				handler (bytes);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBytes (id));
			
		}
		
		#else
		
		handler (getBytes (id));
		
		#end
		
	}
	
	
	public override function loadFont (id:String, handler:Font -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getFont (id));
			
		//}
		
		#else
		
		handler (getFont (id));
		
		#end
		
	}
	
	
	public override function loadSound (id:String, handler:Sound -> Void):Void {
		
		#if (flash || js)
		
		/*if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
				handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {*/
			
			handler (getSound (id));
			
		//}
		
		#else
		
		handler (getSound (id));
		
		#end
		
	}
	
	
}


#if pixi
#elseif flash

class __ASSET__assets_graphics_1x_sprite_1_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_graphics_1x_sprite_1_1_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_graphics_1x_sprite_1_10_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_graphics_1x_sprite_1_4_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_graphics_1x_sprite_1_6_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_graphics_1x_sprite_1_8_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_graphics_1x_sprite_16_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_graphics_1x_sprite_16_1_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_graphics_1x_sprite_16_2_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_graphics_1x_sprite_16_3_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_graphics_1x_sprite_26_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_graphics_1x_sprite_28_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_graphics_1x_sprite_28_1_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_graphics_1x_sprite_3_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_graphics_1x_sprite_3_1_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_graphics_1x_sprite_3_2_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_graphics_1x_sprite_3_3_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_graphics_1x_sprite_30_0_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_graphics_1x_sprite_30_1_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_graphics_1x_tileset_4_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_graphics_default_font_fnt extends flash.utils.ByteArray { }
class __ASSET__assets_graphics_default_font_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_graphics_preloader_badge_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_graphics_preloader_bg_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_graphics_preloader_bg_1_5x_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_graphics_preloader_bg_2x_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_graphics_preloader_bg_4x_png extends flash.display.BitmapData { public function new () { super (0, 0); } }
class __ASSET__assets_music_sound_261_mp3 extends flash.media.Sound { }
class __ASSET__assets_sfx_sound_5_mp3 extends flash.media.Sound { }
class __ASSET__assets_sfx_sound_544_mp3 extends flash.media.Sound { }
class __ASSET__assets_sfx_sound_6_mp3 extends flash.media.Sound { }
class __ASSET__assets_data_behaviors_xml extends flash.utils.ByteArray { }
class __ASSET__assets_data_game_xml extends flash.utils.ByteArray { }
class __ASSET__assets_data_resources_xml extends flash.utils.ByteArray { }
class __ASSET__assets_data_scene_0_scn extends flash.utils.ByteArray { }
class __ASSET__assets_data_scene_0_xml extends flash.utils.ByteArray { }
class __ASSET__assets_data_scene_12_scn extends flash.utils.ByteArray { }
class __ASSET__assets_data_scene_12_xml extends flash.utils.ByteArray { }
class __ASSET__assets_data_scene_13_scn extends flash.utils.ByteArray { }
class __ASSET__assets_data_scene_13_xml extends flash.utils.ByteArray { }
class __ASSET__assets_data_scene_8_scn extends flash.utils.ByteArray { }
class __ASSET__assets_data_scene_8_xml extends flash.utils.ByteArray { }
class __ASSET__assets_data_scenes_xml extends flash.utils.ByteArray { }


#elseif html5














































#end