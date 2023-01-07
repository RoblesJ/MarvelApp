//
//  EventDetail.swift
//  MarvelApp
//
//  Created by JRobles on 27/12/2022.
//


import SwiftUI

struct EventDetail: View {
    private let event: MarvelEventViewModel

    init(event: MarvelEventViewModel) {
        self.event = event
    }

    var body: some View {
        VStack {
            headerView
                .cornerRadius(8)
            listView
        }
    }

    private var headerView: some View {
        HStack(alignment: .center, spacing: .zero) {
            AsyncImage(url: event.eventImg,
                       placeholder: { Text ("Loading") },
                       image: { Image(uiImage: $0).resizable() })

            .frame(width: 128, height: 128)
            Spacer()
            VStack {
                Text(event.title)
                Text(event.startDate)
            }
            .padding(.leading, 8)
            Spacer()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(Color.white)
    }

    private var listView: some View {
        VStack(alignment: .center) {
            Text("Appearance in comics")
                .font(.title)

            List(event.comics, id: \.self) { comic in
                Text(comic)
            }
            .padding(.horizontal, 8)
            .cornerRadius(16)
        }
    }
}

struct EventDetail_Previews: PreviewProvider {
    static var previews: some View {
        EventDetail(event: .init(event: .init(id: .zero, title: "", start: "", thumbnail: Thumbnail(path: ""), comics: .init(items: []))))
    }
}
