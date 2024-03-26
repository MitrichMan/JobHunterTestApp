//
//  VacancyListCellView.swift
//  JobHunterTestApp
//
//  Created by Dmitrii Melnikov on 23.03.2024.
//

import SwiftUI

struct VacancyListCellView: View {
    var vacancy: Vacancy
    var body: some View {
        ZStack {
            Color.gray
            
            VStack(alignment: .leading) {
                HStack {
                    Text("Сейчас просматривает 1 человек")
                        .font(.system(size: 18))
                        .foregroundStyle(.green)
                    
                    Spacer()
                    
                    Button {} label: {
                        Image(.searchDefault)
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                }
                
                Text("UI/UX Designer")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(.white)
                
                Text("Минск")
                    .font(.system(size: 18))
                    .foregroundStyle(.white)
                
                HStack {
                    Text("Мобирикс")
                        .font(.system(size: 18))
                        .foregroundStyle(.white)
                    
                    Image(.searchDefault)
                        .resizable()
                        .frame(width: 16, height: 16)
                    
                    Spacer()
                }
                
                HStack {
                    Image(.searchDefault)
                        .resizable()
                        .frame(width: 16, height: 16)
                    
                    Text("Опыт от 1 года до 3 лет")
                        .font(.system(size: 18))
                        .foregroundStyle(.white)
                    
                    Spacer()
                }
                
                Text("Опубликовано 20 февраля")
                    .foregroundStyle(.yellow)
                
                Button {} label: {
                    ZStack {
                        Capsule()
                            .foregroundStyle(.green)
                        Text("Откликнуться")
                            .foregroundStyle(.white)
                    }
                    .frame(height: 35)
                }
            }
            .padding()
        }
        .cornerRadius(12)
    }
}


#Preview {
    VacancyListCellView(vacancy: Vacancy(
        id: "cbf0c984-7c6c-4ada-82da-e29dc698bb50",
        lookingNumber: 2,
        title: "UI/UX дизайнер",
        address: Address(
            town: "Минск",
            street: "улица Бирюзова",
            house: "4/5"
        ),
        company: "Мобирикс",
        experience: Experience(
            previewText: "Опыт от 1 до 3 лет",
            text: "1–3 года"
        ),
        publishedDate: "2024-02-20",
        isFavorite: false,
        salary: Salary(
            full: "Уровень дохода не указан",
            short: nil
        ),
        schedules: [
            "полная занятость",
            "полный день"
        ],
        appliedNumber: 147,
        description: "Мы ищем специалиста на позицию UX/UI Designer, который вместе с коллегами будет заниматься проектированием пользовательских интерфейсов внутренних и внешних продуктов компании.",
        responsibilities: "- проектирование пользовательских сценариев и создание прототипов;\n- разработка интерфейсов для продуктов компании (Web+App);\n- работа над созданием и улучшением Дизайн-системы;\n- взаимодействие с командами frontend-разработки;\n- контроль качества внедрения дизайна;\n- ситуативно: создание презентаций и других материалов на основе фирменного стиля компании",
        questions: [
            "Где располагается место работы?",
            "Какой график работы?",
            "Вакансия открыта?",
            "Какая оплата труда?"
        ]
    ))
}
