//
//  ContentView.swift
//  Wallaby
//
//  Created by Lukas Nguyen on 2022-11-02.
//

import SwiftUI

struct ContentView: View {
	@EnvironmentObject var viewModel: WallpaperViewModel
	//var wallpapers = [test,test2]
	let columns = [GridItem(.flexible()), GridItem(.flexible())]
	var body: some View {
		
		NavigationView {
			ScrollView {
				
				LazyVGrid(columns: columns, spacing: 11) {
					ForEach(viewModel.wallpapers, id:\.wallpaperId) {
						image in
						HStack{
							NavigationLink(destination: WallpaperView(wallpaper: image)) {
								ThumbnailView(wallpaper: image)
							}
						}
					}
				}
				.navigationTitle(Text("Wallaby"))
				.toolbar {
					NavigationLink(destination: FavoritesView()) {
						Image(systemName: "square.stack")
							.foregroundColor(.mint)
					}
				}
			}
		}
		
	}
}


struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
