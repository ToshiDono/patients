Specialization.delete_all
Symptom.delete_all
Clinic.delete_all
Grade.delete_all
Disease.delete_all
Doctor.delete_all
Patient.delete_all
Drug.delete_all
Visit.delete_all
Illness.delete_all
Prescription.delete_all
IllnessRequest.delete_all

Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each { |seed| load seed }

illnesses = [
    {
        patient_id: Patient.find(1).id,
        doctor_id: Doctor.find(1).id,
        symptoms: [Symptom.find(1), Symptom.find(2)],
        visits: [Visit.find(1), Visit.find(2), Visit.find(3)],
        diseases: [Disease.find(1)]
    },
    {
        patient_id: Patient.find(1).id,
        doctor_id: Doctor.find(2).id,
        symptoms: [Symptom.find(1), Symptom.find(2)],
        visits: [Visit.find(4), Visit.find(5), Visit.find(6)],
        diseases: [Disease.find(32)]
    }
]

illnesses.each do |params|
    Illness.create!(params)
end

prescriptions = [
    { recommendations: Faker::Matz.quote,
      drug_id: Drug.first.id,
      doctor_id: Doctor.find(1).id,
      illness_id: Illness.find(1).id
    },
    {
        recommendations: Faker::Matz.quote,
        drug_id: Drug.find(2).id,
        doctor_id: Doctor.find(1).id,
        illness_id: Illness.find(1).id
    },
    {
        recommendations: Faker::Matz.quote,
        drug_id: Drug.find(3).id,
        doctor_id: Doctor.find(1).id,
        illness_id: Illness.find(1).id
    },
    {
        recommendations: Faker::Matz.quote,
        drug_id: Drug.find(4).id,
        doctor_id: Doctor.find(1).id,
        illness_id: Illness.find(1).id
    },
    {
        recommendations: Faker::Matz.quote,
        drug_id: Drug.find(5).id,
        doctor_id: Doctor.find(2).id,
        illness_id: Illness.find(2).id
    },
    {
        recommendations: Faker::Matz.quote,
        drug_id: Drug.find(1).id,
        doctor_id: Doctor.find(2).id,
        illness_id: Illness.find(2).id
    },
    {
        recommendations: Faker::Matz.quote,
        drug_id: Drug.find(2).id,
        doctor_id: Doctor.find(2).id,
        illness_id: Illness.find(2).id
    },
    {
        recommendations: Faker::Matz.quote,
        drug_id: Drug.find(3).id,
        doctor_id: Doctor.find(2).id,
        illness_id: Illness.find(2).id
    }
]

prescriptions.each do |params|
    Prescription.create!(params)
end

illnesses_requests = [
    {
        patient_id: 1,
        symptoms: [Symptom.find(1), Symptom.find(2)]
    },
    {
        patient_id: 1,
        symptoms: [Symptom.find(3), Symptom.find(4)]
    },
    {
        patient_id: 1,
        symptoms: [Symptom.find(5), Symptom.find(6)]
    },
    {
        patient_id: 2,
        symptoms: [Symptom.find(6), Symptom.find(2)]
    },
    {
        patient_id: 2,
        symptoms: [Symptom.find(3), Symptom.find(1)]
    },
    {
        patient_id: 2,
        symptoms: [Symptom.find(9), Symptom.find(6)]
    }
]

illnesses_requests.each do |params|
    IllnessRequest.create!(params)
end
