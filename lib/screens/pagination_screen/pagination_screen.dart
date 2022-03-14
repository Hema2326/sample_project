// import 'package:flutter/material.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sample_project/screens/pagination_screen/bloc/pagination_bloc.dart';

// class PaginationApiScreen extends StatefulWidget {
//   const PaginationApiScreen({Key? key}) : super(key: key);

//   @override
//   _PaginationApiScreenState createState() => _PaginationApiScreenState();
// }

// class _PaginationApiScreenState extends State<PaginationApiScreen> {
//   late PaginationBloc paginationBloc;
//   ScrollController scrollController = ScrollController();
  

//   void _loadMore() async {
//     if (paginationBloc.hasNextPage == true &&
//         paginationapiBloc.isLoading == false &&
//         paginationapiBloc.isFirstLoading == false) {
//       if (scrollController.position.extentAfter < 250) {
//         setState(() {
//           paginationapiBloc.isLoading = true;
//         });
//         paginationBloc.pageNo += 1;
//         paginationapiBloc.add(PaginationLoadedEvent());
//         paginationapiBloc.isLoading = false;
//       } else {
//         setState(() {
//           paginationapiBloc.hasNextPage = false;
//         });
//       }
//     }
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     paginationBloc = PaginationBloc()..add(PaginationIntialEvent());
//     scrollController = ScrollController()..addListener(_loadMore);
//   }

//   @override
//   void dispose() {
//     scrollController.removeListener(_loadMore);
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Pagination API'),
//         actions: [
//           IconButton(
//             onPressed: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => ImageApiScreen()));
//             },
//             icon: Icon(Icons.arrow_forward_ios),
//           ),
//         ],
//       ),
//       body: BlocListener(
//           bloc: paginationBloc,
//           listener: (BuildContext context, PaginationState state) {},
//           child: BlocBuilder(
//               bloc: paginationBloc,
//               builder: (BuildContext context, PaginationState state) {
//                 if (state is PaginationLoadingState) {
//                   paginationBloc.isLoading == true;
//                   return const Center(child: CircularProgressIndicator());
//                 } else {
//                   if (state is PaginationSucessState) {
//                     return ListView.separated(
//                       controller: scrollController,
//                       itemBuilder: (BuildContext context, int index) {
//                         print(index);
//                         return ListTile(
//                           title: Text(
//                               '${paginationBloc.marketList[index].exchangeId}'),
//                           subtitle: Text(
//                               '${paginationBloc.marketList[index].quoteAsset}'),
//                           trailing: Text(
//                               '${paginationBloc.marketList[index].price}'),
//                         );
//                       },
//                       separatorBuilder: (context, index) => const Divider(
//                         thickness: 1,
//                       ),
//                       itemCount: paginationBloc.marketList.length,
//                     );
//                   }
//                 }
//                 return Container();
//               })),
//     );
//   }
// }
