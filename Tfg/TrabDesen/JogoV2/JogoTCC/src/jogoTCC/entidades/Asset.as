package jogoTCC.entidades
{
	
	public class Asset
	{
		
		private var asset:Class;
		private var nomeAsset:String;
		
		public function Asset(nomeAsset:String, asset:Class)
		{
			this.asset = asset;
			this.nomeAsset = nomeAsset;
		}
		
		public function getAsset():Class
		{
			return asset;
		}
		
		public function setAsset(asset:Class):void
		{
			this.asset = asset;
		}
		
		public function getNomeAsset():String
		{
			return nomeAsset;
		}
		
		public function setNomeAsset(nomeAsset:String):void
		{
			this.nomeAsset = nomeAsset;
		}
	
	}

}