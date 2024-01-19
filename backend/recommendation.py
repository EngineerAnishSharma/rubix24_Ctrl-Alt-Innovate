import pandas as pb
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity


df = pb.read_csv("job_data.csv")


def process_data():
    columns_to_merge = ['Location', 'Language', 'Post' , 'Skills' , 'Disability_Inclusive' , 'Perks']
    df['Skills'] = df['Skills'].str.replace(',' ,' ')
    df['Perks'] = df['Perks'].str.replace(',' ,' ')
    df['data'] = df[columns_to_merge].apply(lambda row: ' '.join(row.values.astype(str)), axis=1)
    df['data'] = df['data'].apply(lambda x:x.lower())



def recommend_data(user_profile):
    process_data()
    company_profiles = df['data']
    cities = df['Location'].astype(str)
    posts = df['Post'].astype(str)
    perks = df['Perks'].astype(str)
    skills =  df['Skills'].astype(str)
    vectorizer = TfidfVectorizer(stop_words='english')
    tfidf_matrix_company = vectorizer.fit_transform(company_profiles)
    city_indices = [vectorizer.vocabulary_.get(city.lower(), -1) for city in cities]
    city_indices = [index for index in city_indices if index != -1]

    post_indices = [vectorizer.vocabulary_.get(post.lower(), -1) for post in posts]
    post_indices = [index for index in post_indices if index != -1]

    perk_indices = [vectorizer.vocabulary_.get(perk.lower(), -1) for perk in perks]
    perk_indices = [index for index in perk_indices if index != -1]

    skill_indices = [vectorizer.vocabulary_.get(skill.lower(), -1) for skill in skills]
    skill_indices = [index for index in skill_indices if index != -1]

    if perk_indices:
        tfidf_matrix_company[:, perk_indices] *= 1.6

    if post_indices:
         tfidf_matrix_company[:, post_indices] *= 1.7

    if city_indices:
         tfidf_matrix_company[:, city_indices] *= 1.8

    if skill_indices:
         tfidf_matrix_company[:, skill_indices] *= 1.9
    def get_recommendations(user_profile, tfidf_matrix_company, top_n=15):
         tfidf_matrix_user = vectorizer.transform([user_profile])

         cosine_similarities = cosine_similarity(tfidf_matrix_user, tfidf_matrix_company).flatten()

         company_similarity_scores = list(zip(range(1, len(company_profiles)+1), cosine_similarities))
         sorted_companies = sorted(company_similarity_scores, key=lambda x: x[1], reverse=True)

         top_recommendations = sorted_companies[:top_n]

         return top_recommendations


    recommendations = get_recommendations(user_profile, tfidf_matrix_company)
    print("Top Company Recommendations:")
    jobs=[]
    for idx, score in recommendations:
        idx=idx-1
        job_details = {
        "Job Title": df.loc[idx, 'Post'],
        "Name": df.loc[idx, 'Name'],
        "Location": df.loc[idx, 'Location'],
        "id": idx
        }
        jobs.append(job_details)
    return jobs

