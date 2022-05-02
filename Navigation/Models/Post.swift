//
//  Post.swift
//  Navigation
//
//  Created by Михаил Усачев on 21.03.2022.
//

import Foundation

struct Post {
    let author: String
    let description: String
    let image: String
    var likes: Int
    var views: Int
}

let myPosts: [Post] = [Post(author: "Здоровье семьи", description: "Казанская сеть клиник сделала консультации ведущих врачей Татарстана и России доступными каждому", image: "01", likes: 20, views: 100),
                       Post(author: "Егерь", description: "Об охотниках-депутатах, шальных выстрелах, взятках от браконьеров и нападениях хищников на людей", image: "02", likes: 34, views: 156),
                       Post(author: "Александр Емельяненко", description: "Скандальная легенда российского ММА о признании ДНР и ЛНР, боях на голых кулаках и уроках тюрьмы", image: "03", likes: 46, views: 204),
                       Post(author: "КАМАЗ", description: "Автогигант анонсировал новую концепцию общественного транспорта Казани", image: "04", likes: 89, views: 502)]

let myImages: [String] = ["101", "102", "103", "104", "105", "106", "107", "108", "109", "110", "111", "112", "113", "114", "115", "116", "117", "118", "119", "120"]
