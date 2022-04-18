package com.example.task_manager

import android.appwidget.AppWidgetManager
import android.content.Context
import android.content.SharedPreferences
import android.widget.RemoteViews
import es.antonborri.home_widget.HomeWidgetProvider
import java.util.Calendar
import com.google.firebase.auth.ktx.auth
import com.google.firebase.ktx.Firebase
import com.google.firebase.firestore.ktx.firestore
import android.util.Log
import android.view.View
import com.google.android.gms.common.util.CollectionUtils.listOf
import com.google.android.gms.tasks.OnCompleteListener
import com.google.firebase.messaging.FirebaseMessaging

class Schedule(val name: String)

class WidgetProvider : HomeWidgetProvider() {
    override fun onUpdate(context: Context, appWidgetManager: AppWidgetManager, appWidgetIds: IntArray, widgetData: SharedPreferences) {
        val calendar = Calendar.getInstance()
        val weekName = arrayOf("日曜日", "月曜日", "火曜日", "水曜日", "木曜日", "金曜日", "土曜日")
        val week: String = weekName[calendar.get(Calendar.DAY_OF_WEEK) - 1]
        val year: String = calendar.get(Calendar.YEAR).toString()
        val month: String = (calendar.get(Calendar.MONTH) + 1).toString().padStart(2, '0')
        val day: String = calendar.get(Calendar.DATE).toString().padStart(2, '0')
        val user = Firebase.auth.currentUser
        var uid = ""
        Log.w("Log", "スタート")
        if (user != null) {
            uid = user.uid
        }
        FirebaseMessaging.getInstance().token.addOnCompleteListener(OnCompleteListener { task ->
            if (!task.isSuccessful) {
                Log.w("Log", "Fetching FCM registration token failed", task.exception)
                return@OnCompleteListener
            }
            val token = task.result
            val views = RemoteViews(context.packageName, R.layout.widget)
            Firebase.firestore.collection("tasks")
                    .whereIn("id", listOf(uid, token))
                    .get()
                    .addOnSuccessListener { result ->
                        Log.d("Log", "数：${result.documents.size}")
                        views.setViewVisibility(R.id.schedule1, View.INVISIBLE)
                        views.setViewVisibility(R.id.schedule2, View.INVISIBLE)

                        for (i in  0..result.documents.size) {
                            views.setViewVisibility(R.id.schedule1, View.VISIBLE)
                            views.setTextViewText(R.id.schedule1, "aa")
                        }
                        appWidgetManager.updateAppWidget(appWidgetIds[0], views)
                    }
                    .addOnFailureListener { exception ->
                        Log.d("Log", "Error getting documents.", exception)
                    }
        })
    }
}
